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
public class UpdateInternshipSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        Internship internship = (Internship) parameter;
        GetAllInternshipsSO getAllInternshipsSO = new GetAllInternshipsSO();
        getAllInternshipsSO.execute(new Internship());
        List<Internship> internships = getAllInternshipsSO.getInternships();
        for (Internship i : internships) {
            if (!i.getIdInternship().equals(internship.getIdInternship()) && i.getStudent().equals(internship.getStudent()) && i.getGrade() == Grade.POLOŽIO) {
                throw new Exception("Student je odbranio stručnu praksu.");
            }
            if (!i.getIdInternship().equals(internship.getIdInternship()) && i.getStudent().equals(internship.getStudent()) && i.getExamPeriod().equals(internship.getExamPeriod())) {
                throw new Exception("Već je evidentirana odbrana stručne prakse u datom ispitnom roku.");
            }
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        Internship internship = (Internship) parameter;
        genericBroker.update(internship.getReport());
        genericBroker.update(internship);
    }

}
