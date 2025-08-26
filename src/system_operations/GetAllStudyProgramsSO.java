/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudyProgram;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllStudyProgramsSO extends AbstractSO {

    private List<StudyProgram> studyPrograms;

    public List<StudyProgram> getStudyPrograms() {
        return studyPrograms;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudyProgram))
            throw new Exception("Sistem ne moze da vrati sve nivoe studija.");
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        studyPrograms = genericBroker.getAll((StudyProgram) parameter, condition);
        GetAllModulesSO getAllModulesSO = new GetAllModulesSO();
        for (StudyProgram studyProgram : studyPrograms) {
            getAllModulesSO.execute(new domain.Module(), " JOIN study_program ON module.id_study_program = study_program.id_study_program"
                + " JOIN study_level ON study_program.id_study_level = study_level.id_study_level WHERE module.id_study_program = " + studyProgram.getIdStudyProgram());
            studyProgram.setModules(getAllModulesSO.getModules());
        }
    }

}
