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
public class InsertTeacherSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Teacher)) {
            throw new Exception("Sistem ne moze da kreira nastavnika");
        }
        Teacher teacher = (Teacher) parameter;
        if (teacher.getFirstName() == null || teacher.getLastName() == null || teacher.getFirstName().isEmpty() || teacher.getLastName().isEmpty()) {
            throw new Exception("Sistem ne moze da kreira nastavnika");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.insert((Teacher) parameter);
    }

}
