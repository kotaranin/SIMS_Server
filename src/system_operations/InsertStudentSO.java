/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Student;

/**
 *
 * @author kotar
 */
public class InsertStudentSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Student))
            throw new Exception("Sistem ne moze da zapamti studenta.");
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.insert((Student) parameter);
    }
    
}
