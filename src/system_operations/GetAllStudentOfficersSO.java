/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudentOfficer;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllStudentOfficersSO extends AbstractSO {

    private List<StudentOfficer> studentOfficers;

    public List<StudentOfficer> getStudentOfficers() {
        return studentOfficers;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudentOfficer)) {
            throw new Exception("Sistem ne moze da zapamti sluzbenika.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        studentOfficers = genericBroker.getAll((StudentOfficer) parameter, "JOIN study_level ON student_officer.id_study_level = study_level.id_study_level ");
    }

}
