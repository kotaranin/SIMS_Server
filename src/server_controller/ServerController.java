/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package server_controller;

import domain.Report;
import domain.StudentOfficer;
import java.util.List;
import system_operations.DeleteReportSO;
import system_operations.GetAllReportsSO;
import system_operations.LogInSO;

/**
 *
 * @author kotar
 */
public class ServerController {

    private static ServerController instance;

    private ServerController() {
    }

    public static ServerController getInstance() {
        if (instance == null) {
            instance = new ServerController();
        }
        return instance;
    }

    public StudentOfficer logIn(StudentOfficer studentOfficer) throws Exception {
        LogInSO logInSO = new LogInSO();
        logInSO.execute(studentOfficer, null);
        System.out.println("Controller Log in SO: " + logInSO.getStudentOfficer());
        return logInSO.getStudentOfficer();
    }

    public List<Report> getAllReports() throws Exception {
        GetAllReportsSO getAllReportsSO = new GetAllReportsSO();
        getAllReportsSO.execute(new Report(), null);
        System.out.println("Controller Get all reports SO: " + getAllReportsSO.getReports());
        return getAllReportsSO.getReports();
    }

    public void deleteReports(Report report) throws Exception {
        DeleteReportSO deleteReportSO = new DeleteReportSO();
        deleteReportSO.execute(report, null);
    }

}
