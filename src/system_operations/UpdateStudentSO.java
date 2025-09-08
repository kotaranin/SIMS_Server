/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Student;
import java.util.List;

/**
 *
 * @author kotar
 */
public class UpdateStudentSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        Student student = (Student) parameter;
        GetAllStudentsSO getAllStudentsSO = new GetAllStudentsSO();
        getAllStudentsSO.executeOperation(new Student());
        List<Student> students = getAllStudentsSO.getStudents();
        for (Student s : students) {
            if (!s.getIdStudent().equals(student.getIdStudent()) && s.getIndexNumber().equals(student.getIndexNumber())) {
                throw new Exception("Nije moguce uneti dva studenta sa istim brojem indeksa.");
            }
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        genericBroker.update((Student) parameter);
    }

}
