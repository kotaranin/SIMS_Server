/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Company;

/**
 *
 * @author kotar
 */
public class UpdateCompanySO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        genericBroker.update((Company) parameter);
    }
    
}
