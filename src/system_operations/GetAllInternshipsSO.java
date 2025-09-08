/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Internship;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllInternshipsSO extends AbstractSO {

    private List<Internship> internships;

    public List<Internship> getInternships() {
        return internships;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Internship)) {
            throw new Exception("Sistem ne moze da vrati strucne prakse.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        internships = genericBroker.getAll((Internship) parameter, "JOIN teacher ON teacher.id_teacher = internship.id_teacher "
                + "JOIN exam_period ON exam_period.id_exam_period = internship.id_exam_period "
                + "JOIN report ON report.id_report = internship.id_report "
                + "JOIN student_officer ON student_officer.id_student_officer = internship.id_student_officer "
                + "JOIN company ON company.id_company = internship.id_company "
                + "JOIN student ON student.id_student = internship.id_student ");
    }

}
