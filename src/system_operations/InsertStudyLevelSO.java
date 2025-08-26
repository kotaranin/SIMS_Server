/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudyLevel;
import domain.StudyProgram;

/**
 *
 * @author Uros
 */
public class InsertStudyLevelSO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudyLevel)) {
            throw new Exception("Sistem ne moze da zapamti nivo studija.");
        }
        StudyLevel studyLevel = (StudyLevel) parameter;
        if (studyLevel.getName() == null || studyLevel.getName().isEmpty()) {
            throw new Exception("Sistem ne moze da zapamti nivo studija.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
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
