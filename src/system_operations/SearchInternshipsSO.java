/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Internship;
import enums.Grade;
import java.util.List;

/**
 *
 * @author kotar
 */
public class SearchInternshipsSO extends AbstractSO {

    private List<Internship> internships;

    public List<Internship> getInternships() {
        return internships;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Internship)) {
            throw new Exception("Sistem ne moze da vrati strucne prakse po zadatom kriterijumu.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        Internship internship = (Internship) parameter;
        condition = "JOIN teacher ON internship.id_teacher = teacher.id_teacher "
                + "JOIN exam_period ON internship.id_exam_period = exam_period.id_exam_period "
                + "JOIN report ON internship.id_report = report.id_report "
                + "JOIN student_officer ON internship.id_student_officer = student_officer.id_student_officer "
                + "JOIN company ON internship.id_company = company.id_company "
                + "JOIN student ON internship.id_student = student.id_student "
                + "WHERE 1 = 1 ";
        if (internship.getStudent() != null && internship.getStudent().getIdStudent() != null) {
            condition += "AND student.id_student = " + internship.getStudent().getIdStudent() + " ";
        }
        if (internship.getCompany() != null && internship.getCompany().getIdCompany() != null) {
            condition += "AND company.id_company = " + internship.getCompany().getIdCompany() + " ";
        }
        if (internship.getGrade() != null && internship.getGrade() != Grade.SVE_OCENE) {
            condition += "AND internship.grade = '" + internship.getGrade() + "' ";
        }
        if (internship.getTeacher() != null && internship.getTeacher().getIdTeacher() != null) {
            condition += "AND teacher.id = " + internship.getTeacher().getIdTeacher() + " ";
        }
        if (internship.getExamPeriod() != null && internship.getExamPeriod().getIdExamPeriod() != null)
            condition += "AND exam_period.id_exam_period = " + internship.getExamPeriod().getIdExamPeriod() + " ";
        internships = genericBroker.getAll(internship, condition);
    }

}
