/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.ExamPeriod;

/**
 *
 * @author kotar
 */
public class DeleteExamPeriodSO extends AbstractSO{

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof ExamPeriod))
            throw new Exception("Sistem ne moze da obrise ispitni rok.");
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.delete((ExamPeriod) parameter);
    }
    
}
