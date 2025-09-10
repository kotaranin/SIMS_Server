/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Teacher;
import validators.AbstractValidator;
import validators.TeacherValidator;

/**
 *
 * @author kotar
 */
public class InsertTeacher extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new TeacherValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        genericBroker.insert((Teacher) parameter);
    }

}
