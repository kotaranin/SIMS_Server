/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudyLevel;
import domain.StudyProgram;
import java.util.List;

/**
 *
 * @author Uros
 */
public class GetAllStudyLevelsSO extends AbstractSO {

    private List<StudyLevel> studyLevels;

    public List<StudyLevel> getStudyLevels() {
        return studyLevels;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudyLevel)) {
            throw new Exception("Sistem ne moze da vrati sve dnevnike prakse");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        studyLevels = genericBroker.getAll((StudyLevel) parameter, null);
        GetStudyProgramsSO getAllStudyProgramsSO = new GetStudyProgramsSO();
        for (StudyLevel studyLevel : studyLevels) {
            getAllStudyProgramsSO.execute(new StudyProgram(), " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE study_program.id_study_level = " + studyLevel.getIdStudyLevel());
            studyLevel.setStudyPrograms(getAllStudyProgramsSO.getStudyPrograms());
        }
    }

}
