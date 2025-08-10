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
public class UpdateExamPeriodSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof ExamPeriod)) {
            throw new Exception("Sistem ne moze da zapamti ispitni rok.");
        }
        ExamPeriod examPeriod = (ExamPeriod) parameter;
        if (examPeriod.getName() == null || examPeriod.getName().isEmpty() || examPeriod.getStartDate() == null || examPeriod.getEndDate() == null || examPeriod.getEndDate().isBefore(examPeriod.getStartDate())) {
            throw new Exception("Sistem ne moze da zapamti ispitni rok.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        genericBroker.update((ExamPeriod) parameter);
    }

}
