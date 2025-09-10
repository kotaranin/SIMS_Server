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
public class SearchTeacher extends AbstractSO {

    private List<Teacher> teachers;

    public List<Teacher> getTeachers() {
        return teachers;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Teacher teacher = (Teacher) parameter;
        String condition = " WHERE LOWER(first_name) LIKE LOWER('%" + teacher.getFirstName() + "%') AND LOWER(last_name) LIKE LOWER('%" + teacher.getLastName() + "%')";
        teachers = genericBroker.getAll(teacher, condition);
    }

}
