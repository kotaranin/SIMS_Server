/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import domain.*;
import java.util.List;
import system_operations.*;

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

    public StudentOfficer passwordLogIn(StudentOfficer studentOfficer) throws Exception {
        PasswordLogInSO logInSO = new PasswordLogInSO();
        logInSO.execute(studentOfficer);
        return logInSO.getStudentOfficer();
    }

    public List<Report> getAllReports() throws Exception {
        GetAllReportsSO getAllReportsSO = new GetAllReportsSO();
        getAllReportsSO.execute(new Report());
        return getAllReportsSO.getReports();
    }

    public void deleteReport(Report report) throws Exception {
        DeleteReportSO deleteReportSO = new DeleteReportSO();
        deleteReportSO.execute(report);
    }

    public void insertReport(Report report) throws Exception {
        InsertReportSO insertReportSO = new InsertReportSO();
        insertReportSO.execute(report);
    }

    public void updateReport(Report report) throws Exception {
        UpdateReportSO updateReportSO = new UpdateReportSO();
        updateReportSO.execute(report);
    }

    public List<Country> getAllCountries() throws Exception {
        GetAllCountriesSO getAllCountriesSO = new GetAllCountriesSO();
        getAllCountriesSO.execute(new Country());
        return getAllCountriesSO.getCountries();
    }

    public void insertCountry(Country country) throws Exception {
        InsertCountrySO insertCountrySO = new InsertCountrySO();
        insertCountrySO.execute(country);
    }

    public void updateCountry(Country country) throws Exception {
        UpdateCountrySO updateCountrySO = new UpdateCountrySO();
        updateCountrySO.execute(country);
    }

    public List<Country> searchCountries(Country country) throws Exception {
        SearchCountriesSO searchCountriesSO = new SearchCountriesSO();
        searchCountriesSO.execute(country);
        return searchCountriesSO.getCountries();
    }

    public List<ExamPeriod> getAllExamPeriods() throws Exception {
        GetAllExamPeriodsSO getAllExamPeriodsSO = new GetAllExamPeriodsSO();
        getAllExamPeriodsSO.execute(new ExamPeriod());
        return getAllExamPeriodsSO.getExamPeriods();
    }

    public void insertExamPeriod(ExamPeriod examPeriod) throws Exception {
        InsertExamPeriodSO insertExamPeriodSO = new InsertExamPeriodSO();
        insertExamPeriodSO.execute(examPeriod);
    }

    public void updateExamPeriod(ExamPeriod examPeriod) throws Exception {
        UpdateExamPeriodSO updateExamPeriodSO = new UpdateExamPeriodSO();
        updateExamPeriodSO.execute(examPeriod);
    }

    public List<ExamPeriod> searchExamPeriods(ExamPeriod examPeriod) throws Exception {
        SearchExamPeriodsSO searchExamPeriodsSO = new SearchExamPeriodsSO();
        searchExamPeriodsSO.execute(examPeriod);
        return searchExamPeriodsSO.getExamPeriods();
    }

    public List<Teacher> getAllTeachers() throws Exception {
        GetAllTeachersSO getAllTeachersSO = new GetAllTeachersSO();
        getAllTeachersSO.execute(new Teacher());
        return getAllTeachersSO.getTeachers();
    }

    public void insertTeacher(Teacher teacher) throws Exception {
        InsertTeacherSO insertTeacherSO = new InsertTeacherSO();
        insertTeacherSO.execute(teacher);
    }

    public void updateTeacher(Teacher teacher) throws Exception {
        UpdateTeacherSO updateTeacherSO = new UpdateTeacherSO();
        updateTeacherSO.execute(teacher);
    }

    public List<Teacher> searchTeachers(Teacher teacher) throws Exception {
        SearchTeachersSO searchTeachersSO = new SearchTeachersSO();
        searchTeachersSO.execute(teacher);
        return searchTeachersSO.getTeachers();
    }

    public List<StudyLevel> getAllStudyLevels() throws Exception {
        GetAllStudyLevelsSO getAllStudyLevelsSO = new GetAllStudyLevelsSO();
        getAllStudyLevelsSO.execute(new StudyLevel());
        return getAllStudyLevelsSO.getStudyLevels();
    }

    public void insertStudyLevel(StudyLevel studyLevel) throws Exception {
        InsertStudyLevelSO insertStudyLevelSO = new InsertStudyLevelSO();
        insertStudyLevelSO.execute(studyLevel);
    }

    public void updateStudyLevel(StudyLevel studyLevel) throws Exception {
        UpdateStudyLevelSO updateStudyLevelSO = new UpdateStudyLevelSO();
        updateStudyLevelSO.execute(studyLevel);
    }

    public List<City> getCities(Country country) throws Exception {
        GetCitiesSO getCitiesSO = new GetCitiesSO();
        getCitiesSO.execute(country);
        return getCitiesSO.getCities();
    }

    public List<StudyProgram> getStudyPrograms(StudyLevel studyLevel) throws Exception {
        GetStudyProgramsSO getStudyProgramsSO = new GetStudyProgramsSO();
        getStudyProgramsSO.execute(studyLevel);
        return getStudyProgramsSO.getStudyPrograms();
    }

    public List<domain.Module> getModules(StudyProgram studyProgram) throws Exception {
        GetModulesSO getModulesSO = new GetModulesSO();
        getModulesSO.execute(studyProgram);
        return getModulesSO.getModules();
    }

    public List<Student> getAllStudents() throws Exception {
        GetAllStudentsSO getAllStudentsSO = new GetAllStudentsSO();
        getAllStudentsSO.execute(new Student());
        return getAllStudentsSO.getStudents();
    }

    public List<City> getAllCities() throws Exception {
        GetAllCitiesSO getAllCitiesSO = new GetAllCitiesSO();
        getAllCitiesSO.execute(new City());
        return getAllCitiesSO.getCities();
    }

    public List<StudyProgram> getAllStudyPrograms() throws Exception {
        GetAllStudyProgramsSO getAllStudyProgramsSO = new GetAllStudyProgramsSO();
        getAllStudyProgramsSO.execute(new StudyProgram());
        return getAllStudyProgramsSO.getStudyPrograms();
    }

    public List<domain.Module> getAllModules() throws Exception {
        GetAllModulesSO getAllModulesSO = new GetAllModulesSO();
        getAllModulesSO.execute(new domain.Module());
        return getAllModulesSO.getModules();
    }

    public List<Student> searchStudents(Student student) throws Exception {
        SearchStudentsSO searchStudentsSO = new SearchStudentsSO();
        searchStudentsSO.execute(student);
        return searchStudentsSO.getStudents();
    }

    public void insertStudent(Student student) throws Exception {
        InsertStudentSO insertStudentSO = new InsertStudentSO();
        insertStudentSO.execute(student);
    }

    public void updateStudent(Student student) throws Exception {
        UpdateStudentSO updateStudentSO = new UpdateStudentSO();
        updateStudentSO.execute(student);
    }

    public List<Company> getAllCompanies() throws Exception {
        GetAllCompaniesSO getAllCompaniesSO = new GetAllCompaniesSO();
        getAllCompaniesSO.execute(new Company());
        return getAllCompaniesSO.getCompanies();
    }

    public List<Internship> getAllInternships() throws Exception {
        GetAllInternshipsSO getAllInternshipsSO = new GetAllInternshipsSO();
        getAllInternshipsSO.execute(new Internship());
        return getAllInternshipsSO.getInternships();
    }

    public void deleteInternship(Internship internship) throws Exception {
        DeleteInternshipSO deleteInternshipSO = new DeleteInternshipSO();
        deleteInternshipSO.execute(internship);
    }

    public void insertInternship(Internship internship) throws Exception {
        InsertInternshipSO insertInternshipSO = new InsertInternshipSO();
        insertInternshipSO.execute(internship);
    }

    public void updateInternship(Internship internship) throws Exception {
        UpdateInternshipSO updateInternshipSO = new UpdateInternshipSO();
        updateInternshipSO.execute(internship);
    }

    public void insertRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        InsertRegistrationRequestSO insertRegistrationRequestSO = new InsertRegistrationRequestSO();
        insertRegistrationRequestSO.execute(registrationRequest);
    }

    public void deleteRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        DeleteRegistrationRequestSO deleteRegistrationRequestSO = new DeleteRegistrationRequestSO();
        deleteRegistrationRequestSO.execute(registrationRequest);
    }

    public void insertStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        InsertStudentOfficerSO insertStudentOfficerSO = new InsertStudentOfficerSO();
        insertStudentOfficerSO.execute(studentOfficer);
    }

    public List<RegistrationRequest> getAllRegistrationRequests() throws Exception {
        GetAllRegistrationRequestsSO getAllRegistrationRequestsSO = new GetAllRegistrationRequestsSO();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest());
        return getAllRegistrationRequestsSO.getRegistrationRequests();
    }

    public List<StudentOfficer> getAllStudentOfficers() throws Exception {
        GetAllStudentOfficersSO getAllStudentOfficersSO = new GetAllStudentOfficersSO();
        getAllStudentOfficersSO.execute(new StudentOfficer());
        return getAllStudentOfficersSO.getStudentOfficers();
    }

    public void insertCompany(Company company) throws Exception {
        InsertCompanySO insertCompanySO = new InsertCompanySO();
        insertCompanySO.execute(company);
    }

    public void updateCompany(Company company) throws Exception {
        UpdateCompanySO updateCompanySO = new UpdateCompanySO();
        updateCompanySO.execute(company);
    }

    public void updateStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        UpdateStudentOfficerSO updateStudentOfficerSO = new UpdateStudentOfficerSO();
        updateStudentOfficerSO.execute(studentOfficer);
    }

    public StudentOfficer questionLogIn(StudentOfficer studentOfficer) throws Exception {
        QuestionLogInSO questionLogInSO = new QuestionLogInSO();
        questionLogInSO.execute(studentOfficer);
        return questionLogInSO.getStudentOfficer();
    }

    public List<Company> searchCompanies(Company company) throws Exception {
        SearchCompaniesSO searchCompaniesSO = new SearchCompaniesSO();
        searchCompaniesSO.execute(company);
        return searchCompaniesSO.getCompanies();
    }

    public List<Internship> searchInternships(Internship internship) throws Exception {
        SearchInternshipsSO searchInternshipsSO = new SearchInternshipsSO();
        searchInternshipsSO.execute(internship);
        return searchInternshipsSO.getInternships();
    }

    public List<RegistrationRequest> searchRegistrationRequests(RegistrationRequest registrationRequest) throws Exception {
        SearchRegistrationRequestsSO searchRegistrationRequestsSO = new SearchRegistrationRequestsSO();
        searchRegistrationRequestsSO.execute(registrationRequest);
        return searchRegistrationRequestsSO.getRegistrationRequests();
    }

}
