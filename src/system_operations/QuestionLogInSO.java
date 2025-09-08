/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.StudentOfficer;
import java.util.List;
import util.PasswordUtil;

/**
 *
 * @author kotar
 */
public class QuestionLogInSO extends AbstractSO {

    private StudentOfficer studentOfficer;

    public StudentOfficer getStudentOfficer() {
        return studentOfficer;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof StudentOfficer)) {
            throw new Exception("Sistem ne moze da uloguje korisnika.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        List<StudentOfficer> studentOfficers = genericBroker.getAll((StudentOfficer) parameter, " JOIN study_level ON student_officer.id_study_level = study_level.id_study_level");
        for (StudentOfficer s : studentOfficers) {
            if (s.getEmail().equals(((StudentOfficer) parameter).getEmail())) {
                String plainAnswer = ((StudentOfficer) parameter).getHashedAnswer();
                String hashedInput = PasswordUtil.hash(plainAnswer, s.getAnswerSalt());
                if (s.getHashedAnswer().equals(hashedInput)) {
                    studentOfficer = s;
                    return;
                }
            }
        }
        throw new Exception("Pogrešan odgovor.");
    }

}
