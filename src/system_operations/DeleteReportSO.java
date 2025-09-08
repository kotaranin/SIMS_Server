/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Report;

/**
 *
 * @author kotar
 */
public class DeleteReportSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Report))
            throw new Exception("Sistem ne moze da obrise dnevnik prakse.");
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        genericBroker.delete((Report) parameter);
    }
    
}
