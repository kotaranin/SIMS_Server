/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Student;
import java.util.List;

/**
 *
 * @author kotar
 */
public class SearchStudentsSO extends AbstractSO {

    private List<Student> students;

    public List<Student> getStudents() {
        return students;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Student)) {
            throw new Exception("Sistem ne moze da vrati sve studente.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        Student student = (Student) parameter;
        String condition = " WHERE 1=1 ";
        if (student.getIndexNumber() != null && !student.getIndexNumber().isEmpty()) {
            condition += "AND student.index_number LIKE '%" + student.getIndexNumber() + "%' ";
        }
        if (student.getFirstName() != null && !student.getFirstName().isEmpty()) {
            condition += "AND LOWER(student.first_name) LIKE '%" + student.getFirstName().toLowerCase() + "%' ";
        }
        if (student.getLastName() != null && !student.getLastName().isEmpty()) {
            condition += "AND LOWER(student.last_name) LIKE '%" + student.getLastName().toLowerCase() + "%' ";
        }
        if (student.getYearOfStudy() != null) {
            condition += "AND student.year_of_study = " + student.getYearOfStudy() + " ";
        }
        if (student.getCity() != null && student.getCity().getIdCity() != null) {
            condition += "AND student.id_city = " + student.getCity().getIdCity() + " ";
        }
        if (student.getStudyProgram() != null && student.getStudyProgram().getIdStudyProgram() != null) {
            condition += "AND student.id_study_program = " + student.getStudyProgram().getIdStudyProgram() + " ";
        }
        if (student.getModule() != null && student.getModule().getIdModule() != null) {
            condition += "AND student.id_module = " + student.getModule().getIdModule() + " ";
        }
        students = genericBroker.getAll(student, " JOIN city ON student.id_city = city.id_city "
                + "JOIN country ON city.id_country = country.id_country "
                + "JOIN study_program ON student.id_study_program = study_program.id_study_program "
                + "JOIN module ON student.id_module = module.id_module "
                + "JOIN study_level ON study_program.id_study_level = study_level.id_study_level " + condition);
    }

}
