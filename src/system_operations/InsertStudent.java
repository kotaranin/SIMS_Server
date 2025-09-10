/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Student;
import java.util.List;
import validators.AbstractValidator;
import validators.StudentValidator;

/**
 *
 * @author kotar
 */
public class InsertStudent extends AbstractSO{

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new StudentValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        Student student = (Student) parameter;
        GetAllStudents getAllStudentsSO = new GetAllStudents();
        getAllStudentsSO.executeOperation(new Student());
        List<Student> students = getAllStudentsSO.getStudents();
        for (Student s : students) {
            if (s.getIndexNumber().equals(student.getIndexNumber()))
                throw new Exception("Nije moguće uneti dva studenta sa istim brojem indeksa.");
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        genericBroker.insert((Student) parameter);
    }
    
}
