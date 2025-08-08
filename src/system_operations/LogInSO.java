/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudentOfficer;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author kotar
 */
public class LogInSO extends AbstractSO {

    private StudentOfficer studentOfficer;

    public StudentOfficer getStudentOfficer() {
        return studentOfficer;
    }

    @Override
    protected void conditions(Object parameter) throws SQLException, Exception {
        System.out.println("Unsupported preconditions in Log in SO");
    }

    @Override
    protected void executeOperation(Object parameter, String key) throws Exception {
        List<StudentOfficer> studentOfficers = genericBroker.getAll((StudentOfficer) parameter, " JOIN study_level ON student_officer.id_study_level = study_level.id_study_level");
        System.out.println("Log in SO: " + studentOfficers);
        for (StudentOfficer s : studentOfficers) {
            if (s.equals((StudentOfficer) parameter)) {
                studentOfficer = s;
                return;
            }
        }
        throw new Exception("Pogresno korisnicko ime ili lozinka!");
    }

}
