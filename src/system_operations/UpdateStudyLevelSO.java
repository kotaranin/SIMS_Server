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
        if (parameter == null || !(parameter instanceof StudyLevel)) {
            throw new Exception("Sistem ne moze da zapamti nivo studija.");
        }
        StudyLevel studyLevel = (StudyLevel) parameter;
        if (studyLevel.getName() == null) {
            throw new Exception("Sistem ne moze da zapamti nivo studija.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        StudyLevel studyLevel = (StudyLevel) parameter;
        GetAllStudyProgramsSO getAllStudyProgramsSO = new GetAllStudyProgramsSO();
        getAllStudyProgramsSO.execute(new StudyProgram(), " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE study_program.id_study_level = " + studyLevel.getIdStudyLevel());
        List<StudyProgram> oldStudyPrograms = getAllStudyProgramsSO.getStudyPrograms();
        GetAllModulesSO getAllModulesSO = new GetAllModulesSO();
        genericBroker.update(studyLevel);
        for (StudyProgram oldStudyProgram : oldStudyPrograms) {
            getAllModulesSO.execute(new domain.Module(), " JOIN study_program ON module.id_study_program = study_program.id_study_program"
                    + " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE module.id_study_program = " + oldStudyProgram.getIdStudyProgram());
            List<domain.Module> oldModules = getAllModulesSO.getModules();
            for (domain.Module oldModule : oldModules) {
                genericBroker.delete(oldModule);
            }
            genericBroker.delete(oldStudyProgram);
        }
        List<StudyProgram> newStudyPrograms = studyLevel.getStudyPrograms();
        for (StudyProgram newStudyProgram : newStudyPrograms) {
            List<domain.Module> newModules = newStudyProgram.getModules();
            newStudyProgram.setStudyLevel(studyLevel);
            Long idStudyProgram = genericBroker.insert(newStudyProgram);
            newStudyProgram.setIdStudyProgram(idStudyProgram);
            for (domain.Module newModule : newModules) {
                newModule.setStudyProgram(newStudyProgram);
                Long idModule = genericBroker.insert(newModule);
                newModule.setIdModule(idModule);
            }
        }
    }

}
