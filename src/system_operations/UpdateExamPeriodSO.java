/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.ExamPeriod;
import java.util.List;

/**
 *
 * @author kotar
 */
public class UpdateExamPeriodSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        ExamPeriod examPeriod = (ExamPeriod) parameter;
        GetAllExamPeriodsSO getAllExamPeriodsSO = new GetAllExamPeriodsSO();
        getAllExamPeriodsSO.execute(new ExamPeriod());
        List<ExamPeriod> examPeriods = getAllExamPeriodsSO.getExamPeriods();
        for (ExamPeriod ep : examPeriods) {
            if (!ep.getIdExamPeriod().equals(examPeriod.getIdExamPeriod()) && ep.getName().toLowerCase().equals(examPeriod.getName().toLowerCase()) && ep.getStartDate().equals(examPeriod.getStartDate()) && ep.getEndDate().equals(examPeriod.getEndDate())) {
                throw new Exception("Nije moguće uneti dva ispitna roka pod istim nazivom, datumom početka i datumom završetka.");
            }
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        genericBroker.update((ExamPeriod) parameter);
    }

}
