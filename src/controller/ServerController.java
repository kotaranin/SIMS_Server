/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import domain.Country;
import domain.ExamPeriod;
import domain.Report;
import domain.StudentOfficer;
import java.util.List;
import system_operations.DeleteCountrySO;
import system_operations.DeleteExamPeriodSO;
import system_operations.DeleteReportSO;
import system_operations.GetAllCountriesSO;
import system_operations.GetAllExamPeriodsSO;
import system_operations.GetAllReportsSO;
import system_operations.InsertCountrySO;
import system_operations.InsertExamPeriodSO;
import system_operations.InsertReportSO;
import system_operations.LogInSO;
import system_operations.SearchCountriesSO;
import system_operations.SearchExamPeriodsSO;
import system_operations.SearchReportsSO;
import system_operations.UpdateCountrySO;
import system_operations.UpdateExamPeriodSO;
import system_operations.UpdateReportSO;

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
        return logInSO.getStudentOfficer();
    }

    public List<Report> getAllReports() throws Exception {
        GetAllReportsSO getAllReportsSO = new GetAllReportsSO();
        getAllReportsSO.execute(new Report(), null);
        return getAllReportsSO.getReports();
    }

    public void deleteReport(Report report) throws Exception {
        DeleteReportSO deleteReportSO = new DeleteReportSO();
        deleteReportSO.execute(report, null);
    }

    public void insertReport(Report report) throws Exception {
        InsertReportSO insertReportSO = new InsertReportSO();
        insertReportSO.execute(report, null);
    }

    public void updateReport(Report report) throws Exception {
        UpdateReportSO updateReportSO = new UpdateReportSO();
        updateReportSO.execute(report, null);
    }

    public List<Report> searchReports(String condition) throws Exception {
        SearchReportsSO searchReportsSO = new SearchReportsSO();
        searchReportsSO.execute(new Report(), condition);
        return searchReportsSO.getReports();
    }

    public List<Country> getAllCountries() throws Exception {
        GetAllCountriesSO getAllCountriesSO = new GetAllCountriesSO();
        getAllCountriesSO.execute(new Country(), null);
        return getAllCountriesSO.getCountries();
    }

    public void deleteCountry(Country country) throws Exception {
        DeleteCountrySO deleteCountrySO = new DeleteCountrySO();
        deleteCountrySO.execute(country, null);
    }

    public void insertCountry(Country country) throws Exception {
        InsertCountrySO insertCountrySO = new InsertCountrySO();
        insertCountrySO.execute(country, null);
    }

    public void updateCountry(Country country) throws Exception {
        UpdateCountrySO updateCountrySO = new UpdateCountrySO();
        updateCountrySO.execute(country, null);
    }

    public List<Country> searchCountries(String condition) throws Exception {
        SearchCountriesSO searchCountriesSO = new SearchCountriesSO();
        searchCountriesSO.execute(new Country(), condition);
        return searchCountriesSO.getCountries();
    }

    public List<ExamPeriod> getAllExamPeriods() throws Exception {
        GetAllExamPeriodsSO getAllExamPeriodsSO = new GetAllExamPeriodsSO();
        getAllExamPeriodsSO.execute(new ExamPeriod(), null);
        return getAllExamPeriodsSO.getExamPeriods();
    }

    public void deleteExamPeriod(ExamPeriod examPeriod) throws Exception {
        DeleteExamPeriodSO deleteExamPeriodSO = new DeleteExamPeriodSO();
        deleteExamPeriodSO.execute(examPeriod, null);
    }

    public void insertExamPeriod(ExamPeriod examPeriod) throws Exception {
        InsertExamPeriodSO insertExamPeriodSO = new InsertExamPeriodSO();
        insertExamPeriodSO.execute(examPeriod, null);
    }

    public void updateExamPeriod(ExamPeriod examPeriod) throws Exception {
        UpdateExamPeriodSO updateExamPeriodSO = new UpdateExamPeriodSO();
        updateExamPeriodSO.execute(examPeriod, null);
    }

    public List<ExamPeriod> searchExamPeriods(String condition) throws Exception {
        SearchExamPeriodsSO searchExamPeriodsSO = new SearchExamPeriodsSO();
        searchExamPeriodsSO.execute(new ExamPeriod(), condition);
        return searchExamPeriodsSO.getExamPeriods();
    }

}
