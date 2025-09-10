/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Country;
import java.util.List;

/**
 *
 * @author kotar
 */
public class SearchCountry extends AbstractSO {

    private List<Country> countries;

    public List<Country> getCountries() {
        return countries;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Country country = (Country) parameter;
        countries = genericBroker.getAll((Country) parameter, " WHERE LOWER(name) LIKE LOWER('%" + country.getName() + "%')");
        GetCities getCitiesSO = new GetCities();
        for (Country c : countries) {
            getCitiesSO.execute(c);
            c.setCities(getCitiesSO.getCities());
        }
    }

}
