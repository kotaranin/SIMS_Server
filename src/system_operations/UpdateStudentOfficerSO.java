/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudentOfficer;
import util.PasswordUtil;

/**
 *
 * @author kotar
 */
public class UpdateStudentOfficerSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudentOfficer)) {
            throw new Exception("Sistem ne moze da zapamti sluzbenika.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        StudentOfficer studentOfficer = (StudentOfficer) parameter;
        String passwordSalt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hash(studentOfficer.getHashedPassword(), passwordSalt);
        studentOfficer.setPasswordSalt(passwordSalt);
        studentOfficer.setHashedPassword(hashedPassword);
        genericBroker.update(studentOfficer);
    }
    
}
