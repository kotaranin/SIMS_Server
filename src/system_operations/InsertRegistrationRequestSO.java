/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.RegistrationRequest;
import domain.StudentOfficer;
import java.util.List;
import util.PasswordUtil;

/**
 *
 * @author kotar
 */
public class InsertRegistrationRequestSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        RegistrationRequest registrationRequest = (RegistrationRequest) parameter;
        GetAllStudentOfficersSO getAllStudentOfficersSO = new GetAllStudentOfficersSO();
        getAllStudentOfficersSO.execute(new StudentOfficer());
        List<StudentOfficer> studentOfficers = getAllStudentOfficersSO.getStudentOfficers();
        for (StudentOfficer studentOfficer : studentOfficers) {
            if (studentOfficer.getEmail().equals(registrationRequest.getEmail()))
                throw new Exception("Nije moguće uneti dva službenika pod istom e-mail adresom.");
        }
        GetAllRegistrationRequestsSO getAllRegistrationRequestsSO = new GetAllRegistrationRequestsSO();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest());
        List<RegistrationRequest> registrationRequests = getAllRegistrationRequestsSO.getRegistrationRequests();
        for (RegistrationRequest rr : registrationRequests) {
            if (rr.getEmail().equals(registrationRequest.getEmail()))
                throw new Exception("Nije moguće uneti dva zahteva za registraciju pod datom e-mail adresom.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        RegistrationRequest registrationRequest = (RegistrationRequest) parameter;
        String passwordSalt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hash(registrationRequest.getHashedPassword(), passwordSalt);
        String answerSalt = PasswordUtil.generateSalt();
        String hashedAnswer = PasswordUtil.hash(registrationRequest.getHashedAnswer(), answerSalt);
        registrationRequest.setPasswordSalt(passwordSalt);
        registrationRequest.setHashedPassword(hashedPassword);
        registrationRequest.setAnswerSalt(answerSalt);
        registrationRequest.setHashedAnswer(hashedAnswer);
        genericBroker.insert(registrationRequest);
    }
    
}
