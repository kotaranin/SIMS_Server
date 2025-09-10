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
 * @author kotar
 */
public class SearchStudyLevel extends AbstractSO {

    private List<StudyLevel> studyLevels;

    public List<StudyLevel> getStudyLevels() {
        return studyLevels;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        studyLevels = genericBroker.getAll(studyLevel, " WHERE LOWER(name) LIKE LOWER('%" + studyLevel.getName() + "%')");
        GetStudyPrograms getStudyProgramsSO = new GetStudyPrograms();
        for (StudyLevel sl : studyLevels) {
            getStudyProgramsSO.execute(sl);
            sl.setStudyPrograms(getStudyProgramsSO.getStudyPrograms());
        }
    }

}
