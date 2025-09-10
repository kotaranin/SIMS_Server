/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudyLevel;
import domain.StudyProgram;
import java.util.List;
import validators.AbstractValidator;
import validators.StudyLevelValidator;

/**
 *
 * @author Uros
 */
public class InsertStudyLevel extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new StudyLevelValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        StudyLevel studyLevel = (StudyLevel) parameter;
        GetAllStudyLevels getAllStudyLevelsSO = new GetAllStudyLevels();
        getAllStudyLevelsSO.execute(new StudyLevel());
        List<StudyLevel> studyLevels = getAllStudyLevelsSO.getStudyLevels();
        for (StudyLevel sl : studyLevels) {
            if (sl.getName().equalsIgnoreCase(studyLevel.getName())) {
                throw new Exception("Nije moguće uneti dva nivoa studija pod istim imenom.");
            }
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
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
