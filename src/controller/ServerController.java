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

    public List<Teacher> getAllTeachers() throws Exception {
        GetAllTeachersSO getAllTeachersSO = new GetAllTeachersSO();
        getAllTeachersSO.execute(new Teacher(), null);
        return getAllTeachersSO.getTeachers();
    }

    public void deleteTeacher(Teacher teacher) throws Exception {
        DeleteTeacherSO deleteTeacherSO = new DeleteTeacherSO();
        deleteTeacherSO.execute(teacher, null);
    }

    public void insertTeacher(Teacher teacher) throws Exception {
        InsertTeacherSO insertTeacherSO = new InsertTeacherSO();
        insertTeacherSO.execute(teacher, null);
    }

    public void updateTeacher(Teacher teacher) throws Exception {
        UpdateTeacherSO updateTeacherSO = new UpdateTeacherSO();
        updateTeacherSO.execute(teacher, null);
    }

    public List<Teacher> searchTeachers(String condition) throws Exception {
        SearchTeachersSO searchTeachersSO = new SearchTeachersSO();
        searchTeachersSO.execute(new Teacher(), condition);
        return searchTeachersSO.getTeachers();
    }

    public List<StudyLevel> getAllStudyLevels() throws Exception {
        GetAllStudyLevelsSO getAllStudyLevelsSO = new GetAllStudyLevelsSO();
        getAllStudyLevelsSO.execute(new StudyLevel(), null);
        return getAllStudyLevelsSO.getStudyLevels();
    }

    public void insertStudyLevel(StudyLevel studyLevel) throws Exception {
        InsertStudyLevelSO insertStudyLevelSO = new InsertStudyLevelSO();
        insertStudyLevelSO.execute(studyLevel, null);
    }

    public void updateStudyLevel(StudyLevel studyLevel) throws Exception {
        UpdateStudyLevelSO updateStudyLevelSO = new UpdateStudyLevelSO();
        updateStudyLevelSO.execute(studyLevel, null);
    }

    public List<StudyLevel> searchStudyLevels(String condition) throws Exception {
        SearchStudyLevelsSO searchStudyLevelsSO = new SearchStudyLevelsSO();
        searchStudyLevelsSO.execute(new StudyLevel(), condition);
        return searchStudyLevelsSO.getStudyLevels();
    }

    public List<City> getCities(Country country) throws Exception {
        GetCitiesSO getAllCitiesSO = new GetCitiesSO();
        getAllCitiesSO.execute(new City(), " JOIN country ON city.id_country = country.id_country WHERE country.id_country = " + country.getIdCountry());
        return getAllCitiesSO.getCities();
    }

    public List<StudyProgram> getStudyPrograms(StudyLevel studyLevel) throws Exception {
        GetStudyProgramsSO getAllStudyProgramsSO = new GetStudyProgramsSO();
        getAllStudyProgramsSO.execute(new StudyProgram(), " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE study_program.id_study_level = " + studyLevel.getIdStudyLevel());
        return getAllStudyProgramsSO.getStudyPrograms();
    }

    public List<domain.Module> getModules(StudyProgram studyProgram) throws Exception {
        GetModulesSO getAllModulesSO = new GetModulesSO();
        getAllModulesSO.execute(new domain.Module(), " JOIN study_program ON module.id_study_program = study_program.id_study_program"
                + " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE module.id_study_program = " + studyProgram.getIdStudyProgram());
        return getAllModulesSO.getModules();
    }

    public List<Student> getAllStudents() throws Exception {
        GetAllStudentsSO getAllStudentsSO = new GetAllStudentsSO();
        getAllStudentsSO.execute(new Student(), null);
        return getAllStudentsSO.getStudents();
    }

    public List<City> getAllCities() throws Exception {
        GetAllCitiesSO getAllCitiesSO = new GetAllCitiesSO();
        getAllCitiesSO.execute(new City(), null);
        return getAllCitiesSO.getCities();
    }

    public List<StudyProgram> getAllStudyPrograms() throws Exception {
        GetAllStudyProgramsSO getAllStudyProgramsSO = new GetAllStudyProgramsSO();
        getAllStudyProgramsSO.execute(new StudyProgram(), null);
        return getAllStudyProgramsSO.getStudyPrograms();
    }

    public List<domain.Module> getAllModules() throws Exception {
        GetAllModulesSO getAllModulesSO = new GetAllModulesSO();
        getAllModulesSO.execute(new domain.Module(), null);
        return getAllModulesSO.getModules();
    }

    public List<Student> searchStudents(Student student) throws Exception {
        StringBuilder condition = new StringBuilder(" WHERE 1=1 ");
        if (student.getIndexNumber() != null && !student.getIndexNumber().isEmpty()) {
            condition.append(" AND student.index_number LIKE '%").append(student.getIndexNumber()).append("%' ");
        }
        if (student.getFirstName() != null && !student.getFirstName().isEmpty()) {
            condition.append(" AND LOWER(student.first_name) LIKE '%").append(student.getFirstName().toLowerCase()).append("%' ");
        }
        if (student.getLastName() != null && !student.getLastName().isEmpty()) {
            condition.append(" AND LOWER(student.last_name) LIKE '%").append(student.getLastName().toLowerCase()).append("%' ");
        }
        if (student.getDateOfBirth() != null) {
            condition.append(" AND student.date_of_birth = '").append(student.getDateOfBirth()).append("' ");
        }
        if (student.getYearOfStudy() != null) {
            condition.append(" AND student.year_of_study = ").append(student.getYearOfStudy());
        }
        if (student.getCity() != null) {
            condition.append(" AND student.id_city = ").append(student.getCity().getIdCity());
        }
        if (student.getStudyProgram() != null) {
            condition.append(" AND student.id_study_program = ").append(student.getStudyProgram().getIdStudyProgram());
        }
        if (student.getModule() != null) {
            condition.append(" AND student.id_module = ").append(student.getModule().getIdModule());
        }
        SearchStudentsSO searchStudentsSO = new SearchStudentsSO();
        searchStudentsSO.execute(new Student(), condition.toString());
        return searchStudentsSO.getStudents();
    }

    public void insertStudent(Student student) throws Exception {
        InsertStudentSO insertStudentSO = new InsertStudentSO();
        insertStudentSO.execute(student, null);
    }

    public void updateStudent(Student student) throws Exception {
        UpdateStudentSO updateStudentSO = new UpdateStudentSO();
        updateStudentSO.execute(student, null);
    }

    public List<Company> getAllCompanies() throws Exception {
        GetAllCompaniesSO getAllCompaniesSO = new GetAllCompaniesSO();
        getAllCompaniesSO.execute(new Company(), null);
        return getAllCompaniesSO.getCompanies();
    }

    public List<Internship> getAllInternships() throws Exception {
        GetAllInternshipsSO getAllInternshipsSO = new GetAllInternshipsSO();
        getAllInternshipsSO.execute(new Internship(), null);
        return getAllInternshipsSO.getInternships();
    }

    public void deleteInternship(Internship internship) throws Exception {
        DeleteInternshipSO deleteInternshipSO = new DeleteInternshipSO();
        deleteInternshipSO.execute(internship, null);
    }

    public void insertInternship(Internship internship) throws Exception {
        InsertInternshipSO insertInternshipSO = new InsertInternshipSO();
        insertInternshipSO.execute(internship, null);
    }

    public void updateInternship(Internship internship) throws Exception {
        UpdateInternshipSO updateInternshipSO = new UpdateInternshipSO();
        updateInternshipSO.execute(internship, null);
    }

    public void insertRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        InsertRegistrationRequestSO insertRegistrationRequestSO = new InsertRegistrationRequestSO();
        insertRegistrationRequestSO.execute(registrationRequest, null);
    }

    public void deleteRegistrationRequest(RegistrationRequest registrationRequest) throws Exception {
        DeleteRegistrationRequestSO deleteRegistrationRequestSO = new DeleteRegistrationRequestSO();
        deleteRegistrationRequestSO.execute(registrationRequest, null);
    }

    public void insertStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        InsertStudentOfficerSO insertStudentOfficerSO = new InsertStudentOfficerSO();
        insertStudentOfficerSO.execute(studentOfficer, null);
    }

    public List<RegistrationRequest> getAllRegistrationRequests() throws Exception {
        GetAllRegistrationRequestsSO getAllRegistrationRequestsSO = new GetAllRegistrationRequestsSO();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest(), null);
        return getAllRegistrationRequestsSO.getRegistrationRequests();
    }

    public List<StudentOfficer> getAllStudentOfficers() throws Exception {
        GetAllStudentOfficersSO getAllStudentOfficersSO = new GetAllStudentOfficersSO();
        getAllStudentOfficersSO.execute(new StudentOfficer(), null);
        return getAllStudentOfficersSO.getStudentOfficers();
    }

    public void insertCompany(Company company) throws Exception {
        InsertCompanySO insertCompanySO = new InsertCompanySO();
        insertCompanySO.execute(company, null);
    }

    public void updateCompany(Company company) throws Exception {
        UpdateCompanySO updateCompanySO = new UpdateCompanySO();
        updateCompanySO.execute(company, null);
    }

    public void updateStudentOfficer(StudentOfficer studentOfficer) throws Exception {
        UpdateStudentOfficerSO updateStudentOfficerSO = new UpdateStudentOfficerSO();
        updateStudentOfficerSO.execute(studentOfficer, null);
    }

    public StudentOfficer questionLogIn(StudentOfficer studentOfficer) throws Exception {
        QuestionLogInSO questionLogInSO = new QuestionLogInSO();
        questionLogInSO.execute(studentOfficer, null);
        return questionLogInSO.getStudentOfficer();
    }

    public List<Company> searchCompanies(Company company) throws Exception {
        SearchCompaniesSO searchCompaniesSO = new SearchCompaniesSO();
        searchCompaniesSO.execute(company, null);
        return searchCompaniesSO.getCompanies();
    }

    public List<Internship> searchInternships(Internship internship) throws Exception {
        SearchInternshipsSO searchInternshipsSO = new SearchInternshipsSO();
        searchInternshipsSO.execute(internship, null);
        return searchInternshipsSO.getInternships();
    }

    public List<RegistrationRequest> searchRegistrationRequests(RegistrationRequest registrationRequest) throws Exception {
        SearchRegistrationRequestsSO searchRegistrationRequestsSO = new SearchRegistrationRequestsSO();
        searchRegistrationRequestsSO.execute(registrationRequest, null);
        return searchRegistrationRequestsSO.getRegistrationRequests();
    }

}
