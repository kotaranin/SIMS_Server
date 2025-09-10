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
        PasswordLogIn logInSO = new PasswordLogIn();
        logInSO.execute(studentOfficer);
        return logInSO.getStudentOfficer();
    }

    public void insertReport(Report report) throws Exception {
        InsertReport insertReportSO = new InsertReport();
        insertReportSO.execute(report);
    }

    public void updateReport(Report report) throws Exception {
        UpdateReport updateReportSO = new UpdateReport();
        updateReportSO.execute(report);
    }

    public List<Country> getAllCountries() throws Exception {
        GetAllCountries getAllCountriesSO = new GetAllCountries();
        getAllCountriesSO.execute(new Country());
        return getAllCountriesSO.getCountries();
    }

    public void insertCountry(Country country) throws Exception {
        InsertCountry insertCountrySO = new InsertCountry();
        insertCountrySO.execute(country);
    }

    public void updateCountry(Country country) throws Exception {
        UpdateCountry updateCountrySO = new UpdateCountry();
        updateCountrySO.execute(country);
    }

    public List<Country> searchCountries(Country country) throws Exception {
        SearchCountry searchCountriesSO = new SearchCountry();
        searchCountriesSO.execute(country);
        return searchCountriesSO.getCountries();
    }

    public List<ExamPeriod> getAllExamPeriods() throws Exception {
        GetAllExamPeriods getAllExamPeriodsSO = new GetAllExamPeriods();
        getAllExamPeriodsSO.execute(new ExamPeriod());
        return getAllExamPeriodsSO.getExamPeriods();
    }

    public void insertExamPeriod(ExamPeriod examPeriod) throws Exception {
        InsertExamPeriod insertExamPeriodSO = new InsertExamPeriod();
        insertExamPeriodSO.execute(examPeriod);
    }

    public void updateExamPeriod(ExamPeriod examPeriod) throws Exception {
        UpdateExamPeriod updateExamPeriodSO = new UpdateExamPeriod();
        updateExamPeriodSO.execute(examPeriod);
    }

    public List<ExamPeriod> searchExamPeriods(ExamPeriod examPeriod) throws Exception {
        SearchExamPeriod searchExamPeriodsSO = new SearchExamPeriod();
        searchExamPeriodsSO.execute(examPeriod);
        return searchExamPeriodsSO.getExamPeriods();
    }

    public List<Teacher> getAllTeachers() throws Exception {
        GetAllTeachers getAllTeachersSO = new GetAllTeachers();
        getAllTeachersSO.execute(new Teacher());
        return getAllTeachersSO.getTeachers();
    }

    public void insertTeacher(Teacher teacher) throws Exception {
        InsertTeacher insertTeacherSO = new InsertTeacher();
        insertTeacherSO.execute(teacher);
    }

    public void updateTeacher(Teacher teacher) throws Exception {
        UpdateTeacher updateTeacherSO = new UpdateTeacher();
        updateTeacherSO.execute(teacher);
    }

    public List<Teacher> searchTeachers(Teacher teacher) throws Exception {
        SearchTeacher searchTeachersSO = new SearchTeacher();
        searchTeachersSO.execute(teacher);
        return searchTeachersSO.getTeachers();
    }

    public List<StudyLevel> getAllStudyLevels() throws Exception {
        GetAllStudyLevels getAllStudyLevelsSO = new GetAllStudyLevels();
        getAllStudyLevelsSO.execute(new StudyLevel());
        return getAllStudyLevelsSO.getStudyLevels();
    }

    public void insertStudyLevel(StudyLevel studyLevel) throws Exception {
        InsertStudyLevel insertStudyLevelSO = new InsertStudyLevel();
        insertStudyLevelSO.execute(studyLevel);
    }

    public void updateStudyLevel(StudyLevel studyLevel) throws Exception {
        UpdateStudyLevel updateStudyLevelSO = new UpdateStudyLevel();
        updateStudyLevelSO.execute(studyLevel);
    }

    public List<City> getCities(Country country) throws Exception {
        GetCities getCitiesSO = new GetCities();
        getCitiesSO.execute(country);
        return getCitiesSO.getCities();
    }

    public List<StudyProgram> getStudyPrograms(StudyLevel studyLevel) throws Exception {
        GetStudyPrograms getStudyProgramsSO = new GetStudyPrograms();
        getStudyProgramsSO.execute(studyLevel);
        return getStudyProgramsSO.getStudyPrograms();
    }

    public List<domain.Module> getModules(StudyProgram studyProgram) throws Exception {
        GetModules getModulesSO = new GetModules();
        getModulesSO.execute(studyProgram);
        return getModulesSO.getModules();
    }

    public List<Student> getAllStudents() throws Exception {
        GetAllStudents getAllStudentsSO = new GetAllStudents();
        getAllStudentsSO.execute(new Student());
        return getAllStudentsSO.getStudents();
    }

    public List<City> getAllCities() throws Exception {
        GetAllCities getAllCitiesSO = new GetAllCities();
        getAllCitiesSO.execute(new City());
        return getAllCitiesSO.getCities();
    }

    public List<StudyProgram> getAllStudyPrograms() throws Exception {
        GetAllStudyPrograms getAllStudyProgramsSO = new GetAllStudyPrograms();
        getAllStudyProgramsSO.execute(new StudyProgram());
        return getAllStudyProgramsSO.getStudyPrograms();
    }

    public List<Student> searchStudents(Student student) throws Exception {
        SearchStudent searchStudentsSO = new SearchStudent();
        searchStudentsSO.execute(student);
        return searchStudentsSO.getStudents();
    }

    public void insertStudent(Student student) throws Exception {
        InsertStudent insertStudentSO = new InsertStudent();
        insertStudentSO.execute(student);
    }

    public void updateStudent(Student student) throws Exception {
        UpdateStudent updateStudentSO = new UpdateStudent();
        updateStudentSO.execute(student);
    }

    public List<Company> getAllCompanies() throws Exception {
        GetAllCompanies getAllCompaniesSO = new GetAllCompanies();
        getAllCompaniesSO.execute(new Company());
        return getAllCompaniesSO.getCompanies();
    }

    public List<Internship> getAllInternships() throws Exception {
        GetAllInternships getAllInternshipsSO = new GetAllInternships();
        getAllInternshipsSO.execute(new Internship());
        return getAllInternshipsSO.getInternships();
    }

    public void deleteInternship(Internship internship) throws Exception {
        DeleteInternship deleteInternshipSO = new DeleteInternship();
        deleteInternshipSO.execute(internship);
    }

    public void insertInternship(Internship internship) throws Exception {
        InsertInternship insertInternshipSO = new InsertInternship();
        insertInternshipSO.execute(internship);
    }

    public void updateInternship(Internship internship) throws Exception {
        UpdateInternship updateInternshipSO = new UpdateInternship();
        updateInternshipSO.execute(internship);
    }

    public void insertRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        InsertRegistrationRequest insertRegistrationRequestSO = new InsertRegistrationRequest();
        insertRegistrationRequestSO.execute(registrationRequest);
    }

    public void deleteRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        DeleteRegistrationRequest deleteRegistrationRequestSO = new DeleteRegistrationRequest();
        deleteRegistrationRequestSO.execute(registrationRequest);
    }

    public void insertStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        InsertStudentOfficer insertStudentOfficerSO = new InsertStudentOfficer();
        insertStudentOfficerSO.execute(studentOfficer);
    }

    public List<RegistrationRequest> getAllRegistrationRequests() throws Exception {
        GetAllRegistrationRequests getAllRegistrationRequestsSO = new GetAllRegistrationRequests();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest());
        return getAllRegistrationRequestsSO.getRegistrationRequests();
    }

    public List<StudentOfficer> getAllStudentOfficers() throws Exception {
        GetAllStudentOfficers getAllStudentOfficersSO = new GetAllStudentOfficers();
        getAllStudentOfficersSO.execute(new StudentOfficer());
        return getAllStudentOfficersSO.getStudentOfficers();
    }

    public void insertCompany(Company company) throws Exception {
        InsertCompany insertCompanySO = new InsertCompany();
        insertCompanySO.execute(company);
    }

    public void updateCompany(Company company) throws Exception {
        UpdateCompany updateCompanySO = new UpdateCompany();
        updateCompanySO.execute(company);
    }

    public void updateStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        UpdateStudentOfficer updateStudentOfficerSO = new UpdateStudentOfficer();
        updateStudentOfficerSO.execute(studentOfficer);
    }

    public StudentOfficer questionLogIn(StudentOfficer studentOfficer) throws Exception {
        QuestionLogIn questionLogInSO = new QuestionLogIn();
        questionLogInSO.execute(studentOfficer);
        return questionLogInSO.getStudentOfficer();
    }

    public List<Company> searchCompanies(Company company) throws Exception {
        SearchCompany searchCompaniesSO = new SearchCompany();
        searchCompaniesSO.execute(company);
        return searchCompaniesSO.getCompanies();
    }

    public List<Internship> searchInternships(Internship internship) throws Exception {
        SearchInternship searchInternshipsSO = new SearchInternship();
        searchInternshipsSO.execute(internship);
        return searchInternshipsSO.getInternships();
    }

    public List<RegistrationRequest> searchRegistrationRequests(RegistrationRequest registrationRequest) throws Exception {
        SearchRegistrationRequest searchRegistrationRequestsSO = new SearchRegistrationRequest();
        searchRegistrationRequestsSO.execute(registrationRequest);
        return searchRegistrationRequestsSO.getRegistrationRequests();
    }

    public List<StudyLevel> searchStudyLevels(StudyLevel studyLevel) throws Exception {
        SearchStudyLevel searchStudyLevel = new SearchStudyLevel();
        searchStudyLevel.execute(studyLevel);
        return searchStudyLevel.getStudyLevels();
    }

}
