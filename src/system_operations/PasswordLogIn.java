/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.StudentOfficer;
import java.util.List;
import java.sql.SQLException;
import util.PasswordUtil;

/**
 *
 * @author kotar
 */
public class PasswordLogIn extends AbstractSO {

    private StudentOfficer studentOfficer;

    public StudentOfficer getStudentOfficer() {
        return studentOfficer;
    }

    @Override
    protected void validate(AbstractDO parameter) throws SQLException, Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        List<StudentOfficer> studentOfficers = genericBroker.getAll((StudentOfficer) parameter, " JOIN study_level ON student_officer.id_study_level = study_level.id_study_level");
        for (StudentOfficer s : studentOfficers) {
            if (s.getEmail().equals(((StudentOfficer) parameter).getEmail())) {
                String plainPassword = ((StudentOfficer) parameter).getHashedPassword();
                String hashedInput = PasswordUtil.hash(plainPassword, s.getPasswordSalt());
                if (s.getHashedPassword().equals(hashedInput)) {
                    studentOfficer = s;
                    return;
                }
            }
        }
        throw new Exception("E-mail ili lozinka nisu ispravni.");
    }

}
