/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import java.util.List;

/**
 *
 * @author kotar
 */
public class GetModulesSO extends AbstractSO {

    private List<domain.Module> modules;

    public List<domain.Module> getModules() {
        return modules;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof domain.Module)) {
            throw new Exception("Sistem ne moze da vrati sve module.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        modules = genericBroker.getAll((domain.Module) parameter, condition);
    }

}
