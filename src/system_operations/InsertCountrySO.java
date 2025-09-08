/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.City;
import domain.Country;
import java.util.List;

/**
 *
 * @author kotar
 */
public class InsertCountrySO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        Country country = (Country) parameter;
        GetAllCountriesSO getAllCountriesSO = new GetAllCountriesSO();
        getAllCountriesSO.execute(new Country());
        List<Country> countries = getAllCountriesSO.getCountries();
        for (Country c : countries) {
            if (c.getName().equals(country.getName()))
                throw new Exception("Nije moguće uneti dve države pod istim imenom.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        Country country = (Country) parameter;
        Long idCountry = genericBroker.insert(country);
        country.setIdCountry(idCountry);
        for (City city : country.getCities()) {
            city.setCountry(country);
            long idCity = genericBroker.insert(city);
            city.setIdCity(idCity);
        }
    }

}
