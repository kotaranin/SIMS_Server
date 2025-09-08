/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Country;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllCountriesSO extends AbstractSO {

    private List<Country> countries;

    public List<Country> getCountries() {
        return countries;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Country))
            throw new Exception("Sistem ne moze da vrati sve drzave.");
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        countries = genericBroker.getAll((Country) parameter, null);
    }

}
