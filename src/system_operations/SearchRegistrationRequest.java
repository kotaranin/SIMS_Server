/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.RegistrationRequest;
import java.util.List;

/**
 *
 * @author kotar
 */
public class SearchRegistrationRequest extends AbstractSO {

    private List<RegistrationRequest> registrationRequests;

    public List<RegistrationRequest> getRegistrationRequests() {
        return registrationRequests;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        RegistrationRequest registrationRequest = (RegistrationRequest) parameter;
        String condition = "JOIN study_level ON registration_request.id_study_level = study_level.id_study_level "
                + "WHERE 1 = 1 ";
        if (registrationRequest.getFirstName() != null && !registrationRequest.getFirstName().isEmpty()) {
            condition += "AND LOWER(registration_request.first_name) LIKE '%" + registrationRequest.getFirstName().toLowerCase() + "%' ";
        }
        if (registrationRequest.getLastName() != null && !registrationRequest.getLastName().isEmpty()) {
            condition += "AND LOWER(registration_request.last_name) LIKE '%" + registrationRequest.getLastName().toLowerCase() + "%' ";
        }
        if (registrationRequest.getEmail() != null && !registrationRequest.getEmail().isEmpty()) {
            condition += "AND LOWER(registration_request.email) LIKE '%" + registrationRequest.getEmail().toLowerCase() + "%' ";
        }
        if (registrationRequest.getStudyLevel() != null && registrationRequest.getStudyLevel().getIdStudyLevel() != null) {
            condition += "AND study_level.id_study_level = " + registrationRequest.getStudyLevel().getIdStudyLevel() + " ";
        }
        registrationRequests = genericBroker.getAll(registrationRequest, condition);
    }

}
