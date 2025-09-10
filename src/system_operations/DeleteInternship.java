/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Internship;
import java.util.List;

/**
 *
 * @author kotar
 */
public class DeleteInternship extends AbstractSO{

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        Internship internship = (Internship) parameter;
        GetAllInternships getAllInternshipsSO = new GetAllInternships();
        getAllInternshipsSO.execute(new Internship());
        List<Internship> internships = getAllInternshipsSO.getInternships();
        for (Internship i : internships) {
            if (i.getIdInternship().equals(internship.getIdInternship()))
                return;
        }
        throw new Exception("Stručna praksa ne postoji u bazi podataka.");
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Internship internship = (Internship) parameter;
        genericBroker.delete(internship);
        genericBroker.delete(internship.getReport());
    }
    
}
