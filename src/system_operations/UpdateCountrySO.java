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
public class UpdateCountrySO extends AbstractSO {

    @Override
    protected void conditions(Object parameter) throws Exception {
        Country country = (Country) parameter;
        GetAllCountriesSO getAllCountriesSO = new GetAllCountriesSO();
        getAllCountriesSO.execute(new Country());
        List<Country> countries = getAllCountriesSO.getCountries();
        for (Country c : countries) {
            if (!c.getIdCountry().equals(country.getIdCountry()) && c.getName().equals(country.getName()))
                throw new Exception("Nije moguce uneti dve drzave pod istim imenom.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        Country country = (Country) parameter;
        for (City city : country.getCities()) {
            city.setCountry(country);
            if (city.getIdCity() == null) {
                long idCity = genericBroker.insert(city);
                city.setIdCity(idCity);
            } else {
                genericBroker.update(city);
            }
        }
        genericBroker.update(country);
    }

}
