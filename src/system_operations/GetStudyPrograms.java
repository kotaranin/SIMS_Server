/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudyLevel;
import domain.StudyProgram;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetStudyPrograms extends AbstractSO {

    private List<StudyProgram> studyPrograms;

    public List<StudyProgram> getStudyPrograms() {
        return studyPrograms;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        studyPrograms = genericBroker.getAll(new StudyProgram(), " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE study_program.id_study_level = " + studyLevel.getIdStudyLevel());
        GetModules getModulesSO = new GetModules();
        for (StudyProgram studyProgram : studyPrograms) {
            getModulesSO.execute(studyProgram);
            studyProgram.setModules(getModulesSO.getModules());
        }
    }

}
