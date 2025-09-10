/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudentOfficer;

/**
 *
 * @author kotar
 */
public class InsertStudentOfficer extends AbstractSO{

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        StudentOfficer studentOfficer = (StudentOfficer) parameter;
        genericBroker.insert(studentOfficer);
    }
    
}
