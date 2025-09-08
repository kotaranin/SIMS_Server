/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Teacher;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllTeachersSO extends AbstractSO {

    private List<Teacher> teachers;

    public List<Teacher> getTeachers() {
        return teachers;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Teacher))
            throw new Exception("Sistem ne moze da vrati sve nastavnike.");
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        teachers = genericBroker.getAll((Teacher) parameter, null);
    }

}
