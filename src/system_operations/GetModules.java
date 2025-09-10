/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudyProgram;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetModules extends AbstractSO {

    private List<domain.Module> modules;

    public List<domain.Module> getModules() {
        return modules;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        StudyProgram studyProgram = (StudyProgram) parameter;
        modules = genericBroker.getAll(new domain.Module(), " JOIN study_program ON module.id_study_program = study_program.id_study_program"
                + " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE module.id_study_program = " + studyProgram.getIdStudyProgram());
    }

}
