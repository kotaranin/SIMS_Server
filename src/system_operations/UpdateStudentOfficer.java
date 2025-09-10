/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudentOfficer;
import util.PasswordUtil;
import validators.AbstractValidator;
import validators.StudentOfficerValidator;

/**
 *
 * @author kotar
 */
public class UpdateStudentOfficer extends AbstractSO{

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new StudentOfficerValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        StudentOfficer studentOfficer = (StudentOfficer) parameter;
        String passwordSalt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hash(studentOfficer.getHashedPassword(), passwordSalt);
        studentOfficer.setPasswordSalt(passwordSalt);
        studentOfficer.setHashedPassword(hashedPassword);
        genericBroker.update(studentOfficer);
    }
    
}
