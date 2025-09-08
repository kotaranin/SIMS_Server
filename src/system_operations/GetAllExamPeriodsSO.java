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
public class GetAllExamPeriodsSO extends AbstractSO {

    private List<ExamPeriod> examPeriods;

    public List<ExamPeriod> getExamPeriods() {
        return examPeriods;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof ExamPeriod))
            throw new Exception("Sistem ne moze da vrati sve ispitne rokove.");
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        examPeriods = genericBroker.getAll((ExamPeriod) parameter, null);
    }

}
