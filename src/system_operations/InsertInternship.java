/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Internship;
import enums.Grade;
import java.util.List;
import validators.AbstractValidator;
import validators.InternshipValidator;

/**
 *
 * @author kotar
 */
public class InsertInternship extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new InternshipValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        Internship internship = (Internship) parameter;
        GetAllInternships getAllInternshipsSO = new GetAllInternships();
        getAllInternshipsSO.execute(new Internship());
        List<Internship> internships = getAllInternshipsSO.getInternships();
        for (Internship i : internships) {
            if (i.getStudent().equals(internship.getStudent()) && i.getGrade() == Grade.POLOŽIO)
                throw new Exception("Student je odbranio stručnu praksu.");
            if (i.getStudent().equals(internship.getStudent()) && i.getExamPeriod().equals(internship.getExamPeriod()))
                throw new Exception("Već je evidentirana odbrana stručne prakse u datom ispitnom roku.");
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Internship internship = (Internship) parameter;
        long idReport = genericBroker.insert(internship.getReport());
        internship.getReport().setIdReport(idReport);
        genericBroker.insert(internship);
    }

}
