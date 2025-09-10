/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Report;
import validators.AbstractValidator;
import validators.ReportValidator;

/**
 *
 * @author kotar
 */
public class InsertReport extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new ReportValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        genericBroker.insert((Report) parameter);
    }
    
}
