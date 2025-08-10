/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Teacher;

/**
 *
 * @author kotar
 */
public class DeleteTeacherSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Teacher) )
            throw new Exception("Sistem ne moze da obrise nastavnika");
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.delete((Teacher) parameter);
    }
    
}
