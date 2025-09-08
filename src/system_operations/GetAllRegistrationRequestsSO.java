/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.RegistrationRequest;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllRegistrationRequestsSO extends AbstractSO {

    private List<RegistrationRequest> registrationRequests;

    public List<RegistrationRequest> getRegistrationRequests() {
        return registrationRequests;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof RegistrationRequest)) {
            throw new Exception("Sistem ne moze da vrati zahteve za registraciju.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        registrationRequests = genericBroker.getAll((RegistrationRequest) parameter, "JOIN study_level ON registration_request.id_study_level = study_level.id_study_level ");
    }

}
