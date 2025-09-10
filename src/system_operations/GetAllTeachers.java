/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Teacher;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllTeachers extends AbstractSO {

    private List<Teacher> teachers;

    public List<Teacher> getTeachers() {
        return teachers;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        teachers = genericBroker.getAll((Teacher) parameter, null);
    }

}
