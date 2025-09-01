/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Internship;

/**
 *
 * @author kotar
 */
public class UpdateInternshipSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Internship)) {
            throw new Exception("Sistem ne moze da kreira strucnu praksu.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        Internship internship = (Internship) parameter;
        genericBroker.update(internship.getReport());
        genericBroker.update(internship);
    }

}
