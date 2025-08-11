/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudyLevel;

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
        genericBroker.update((StudyLevel) parameter);
    }

}
