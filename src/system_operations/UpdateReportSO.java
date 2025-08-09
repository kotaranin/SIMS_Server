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
public class UpdateReportSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Report)) {
            throw new Exception("Sistem ne moze da kreira dnevnik prakse.");
        }
        Report report = (Report) parameter;
        if (report.getFileName() == null || report.getFileName().isEmpty() || report.getFileContent() == null) {
            throw new Exception("Sistem ne moze da kreira dnevnik prakse.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.update((Report) parameter);
    }

}
