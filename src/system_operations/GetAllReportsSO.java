/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Report;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllReportsSO extends AbstractSO {

    private List<Report> reports;

    public List<Report> getReports() {
        return reports;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {

    }

    @Override
    protected void executeOperation(Object parameter, String key) throws Exception {
        reports = genericBroker.getAll((Report) parameter, null);
    }

}
