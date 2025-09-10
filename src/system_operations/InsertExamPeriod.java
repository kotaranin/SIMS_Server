/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.ExamPeriod;
import java.util.List;
import validators.AbstractValidator;
import validators.ExamPeriodValidator;

/**
 *
 * @author kotar
 */
public class InsertExamPeriod extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new ExamPeriodValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        ExamPeriod examPeriod = (ExamPeriod) parameter;
        GetAllExamPeriods getAllExamPeriodsSO = new GetAllExamPeriods();
        getAllExamPeriodsSO.execute(new ExamPeriod());
        List<ExamPeriod> examPeriods = getAllExamPeriodsSO.getExamPeriods();
        for (ExamPeriod ep : examPeriods) {
            if (ep.getName().toLowerCase().equals(examPeriod.getName().toLowerCase()) && ep.getStartDate().equals(examPeriod.getStartDate()) && ep.getEndDate().equals(examPeriod.getEndDate())) {
                throw new Exception("Nije moguće uneti dva ispitna roka pod istim nazivom, datumom početka i datumom završetka.");
            }
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        genericBroker.insert((ExamPeriod) parameter);
    }

}
