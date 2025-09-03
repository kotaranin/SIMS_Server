/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.RegistrationRequest;
import util.PasswordUtil;

/**
 *
 * @author kotar
 */
public class InsertRegistrationRequestSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof RegistrationRequest))
            throw new Exception("Sistem ne moze da zapamti zahtev za registraciju.");
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
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
