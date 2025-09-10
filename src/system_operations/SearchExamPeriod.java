/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.ExamPeriod;
import java.util.List;

/**
 *
 * @author kotar
 */
public class SearchExamPeriod extends AbstractSO {

    private List<ExamPeriod> examPeriods;

    public List<ExamPeriod> getExamPeriods() {
        return examPeriods;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        ExamPeriod examPeriod = (ExamPeriod) parameter;
        examPeriods = genericBroker.getAll((ExamPeriod) parameter, " WHERE LOWER(exam_period.name) LIKE LOWER('%" + examPeriod.getName() + "%')");
    }

}
