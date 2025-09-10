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
public class GetAllRegistrationRequests extends AbstractSO {

    private List<RegistrationRequest> registrationRequests;

    public List<RegistrationRequest> getRegistrationRequests() {
        return registrationRequests;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        registrationRequests = genericBroker.getAll((RegistrationRequest) parameter, "JOIN study_level ON registration_request.id_study_level = study_level.id_study_level ");
    }

}
