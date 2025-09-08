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
public class InsertStudyLevelSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        GetAllStudyLevelsSO getAllStudyLevelsSO = new GetAllStudyLevelsSO();
        getAllStudyLevelsSO.execute(new StudyLevel());
        List<StudyLevel> studyLevels = getAllStudyLevelsSO.getStudyLevels();
        for (StudyLevel sl : studyLevels) {
            if (sl.getName().equalsIgnoreCase(studyLevel.getName())) {
                throw new Exception("Nije moguće uneti dva nivoa studija pod istim imenom.");
            }
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        Long idStudyLevel = genericBroker.insert(studyLevel);
        studyLevel.setIdStudyLevel(idStudyLevel);
        for (StudyProgram studyProgram : studyLevel.getStudyPrograms()) {
            studyProgram.setStudyLevel(studyLevel);
            Long idStudyProgram = genericBroker.insert(studyProgram);
            studyProgram.setIdStudyProgram(idStudyProgram);
            for (domain.Module module : studyProgram.getModules()) {
                module.setStudyProgram(studyProgram);
                Long idModule = genericBroker.insert(module);
                module.setIdModule(idModule);
            }
        }
    }

}
