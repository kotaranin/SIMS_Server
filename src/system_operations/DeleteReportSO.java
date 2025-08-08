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
        
    }

    @Override
    protected void executeOperation(Object parameter, String key) throws Exception {
        genericBroker.delete((Report) parameter);
    }
    
}
