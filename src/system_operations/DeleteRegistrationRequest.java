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
public class DeleteRegistrationRequest extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        RegistrationRequest registrationRequest = (RegistrationRequest) parameter;
        GetAllRegistrationRequests getAllRegistrationRequestsSO = new GetAllRegistrationRequests();
        getAllRegistrationRequestsSO.execute(new RegistrationRequest());
        List<RegistrationRequest> registrationRequests = getAllRegistrationRequestsSO.getRegistrationRequests();
        for (RegistrationRequest rg : registrationRequests) {
            if (rg.getIdRegistrationRequest().equals(registrationRequest.getIdRegistrationRequest()))
                return;
        }
        throw new Exception("Zahtev za registraciju ne postoji u bazi podataka.");
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        genericBroker.delete((RegistrationRequest) parameter);
    }

}
