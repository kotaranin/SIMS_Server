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
public class GetAllStudyPrograms extends AbstractSO {

    private List<StudyProgram> studyPrograms;

    public List<StudyProgram> getStudyPrograms() {
        return studyPrograms;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        studyPrograms = genericBroker.getAll((StudyProgram) parameter, " JOIN study_level ON study_program.id_study_level = study_level.id_study_level ");
        GetModules getAllModulesSO = new GetModules();
        for (StudyProgram studyProgram : studyPrograms) {
            getAllModulesSO.execute(studyProgram);
            studyProgram.setModules(getAllModulesSO.getModules());
        }
    }
}
