/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudyLevel;
import java.util.List;

/**
 *
 * @author Uros
 */
public class GetAllStudyLevels extends AbstractSO {

    private List<StudyLevel> studyLevels;

    public List<StudyLevel> getStudyLevels() {
        return studyLevels;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        studyLevels = genericBroker.getAll((StudyLevel) parameter, null);
        GetStudyPrograms getStudyProgramsSO = new GetStudyPrograms();
        for (StudyLevel studyLevel : studyLevels) {
            getStudyProgramsSO.execute(studyLevel);
            studyLevel.setStudyPrograms(getStudyProgramsSO.getStudyPrograms());
        }
    }

}
