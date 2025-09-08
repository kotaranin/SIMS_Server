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
public class UpdateStudyLevelSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        GetAllStudyLevelsSO getAllStudyLevelsSO = new GetAllStudyLevelsSO();
        getAllStudyLevelsSO.execute(new StudyLevel());
        List<StudyLevel> studyLevels = getAllStudyLevelsSO.getStudyLevels();
        for (StudyLevel sl : studyLevels) {
            if (!sl.getIdStudyLevel().equals(studyLevel.getIdStudyLevel()) && sl.getName().equalsIgnoreCase(studyLevel.getName())) {
                throw new Exception("Nije moguće uneti dva nivoa studija pod istim imenom.");
            }
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        for (StudyProgram studyProgram : studyLevel.getStudyPrograms()) {
            studyProgram.setStudyLevel(studyLevel);
            if (studyProgram.getIdStudyProgram() == null) {
                Long idStudyProgram = genericBroker.insert(studyProgram);
                studyProgram.setIdStudyProgram(idStudyProgram);
                for (domain.Module module : studyProgram.getModules()) {
                    module.setStudyProgram(studyProgram);
                    Long idModule = genericBroker.insert(module);
                    module.setIdModule(idModule);
                }
            } else {
                for (domain.Module module : studyProgram.getModules()) {
                    module.setStudyProgram(studyProgram);
                    if (module.getIdModule() == null) {
                        Long idModule = genericBroker.insert(module);
                        module.setIdModule(idModule);
                    } else {
                        genericBroker.update(module);
                    }
                }
            }
            genericBroker.update(studyProgram);
        }
        genericBroker.update(studyLevel);
    }

}
