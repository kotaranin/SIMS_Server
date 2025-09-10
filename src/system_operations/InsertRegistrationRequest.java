/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.RegistrationRequest;
import domain.StudentOfficer;
import java.util.List;
import util.PasswordUtil;
import validators.AbstractValidator;
import validators.RegistrationRequestValidator;

/**
 *
 * @author kotar
 */
public class InsertRegistrationRequest extends AbstractSO{

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new RegistrationRequestValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        RegistrationRequest registrationRequest = (RegistrationRequest) parameter;
        GetAllStudentOfficers getAllStudentOfficersSO = new GetAllStudentOfficers();
        getAllStudentOfficersSO.execute(new StudentOfficer());
        List<StudentOfficer> studentOfficers = getAllStudentOfficersSO.getStudentOfficers();
        for (StudentOfficer studentOfficer : studentOfficers) {
            if (studentOfficer.getEmail().equals(registrationRequest.getEmail()))
                throw new Exception("Nije moguće uneti dva službenika pod istom e-mail adresom.");
        }
        GetAllRegistrationRequests getAllRegistrationRequestsSO = new GetAllRegistrationRequests();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest());
        List<RegistrationRequest> registrationRequests = getAllRegistrationRequestsSO.getRegistrationRequests();
        for (RegistrationRequest rr : registrationRequests) {
            if (rr.getEmail().equals(registrationRequest.getEmail()))
                throw new Exception("Nije moguće uneti dva zahteva za registraciju pod datom e-mail adresom.");
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
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
