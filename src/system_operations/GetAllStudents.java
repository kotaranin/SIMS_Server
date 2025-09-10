/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Student;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllStudents extends AbstractSO {

    private List<Student> students;

    public List<Student> getStudents() {
        return students;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        students = genericBroker.getAll((Student) parameter, " JOIN city ON student.id_city = city.id_city "
                + "JOIN country ON city.id_country = country.id_country "
                + "JOIN study_program ON student.id_study_program = study_program.id_study_program "
                + "LEFT JOIN module ON student.id_module = module.id_module "
                + "JOIN study_level ON study_program.id_study_level = study_level.id_study_level ");
    }

}
