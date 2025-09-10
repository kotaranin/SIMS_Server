/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.City;
import domain.Country;
import java.util.List;
import validators.AbstractValidator;
import validators.CountryValidator;

/**
 *
 * @author kotar
 */
public class UpdateCountry extends AbstractSO {

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
        AbstractValidator validator = new CountryValidator();
        validator.checkElementaryContraints(parameter);
        validator.checkComplexContraints(parameter);
        Country country = (Country) parameter;
        GetAllCountries getAllCountriesSO = new GetAllCountries();
        getAllCountriesSO.execute(new Country());
        List<Country> countries = getAllCountriesSO.getCountries();
        for (Country c : countries) {
            if (!c.getIdCountry().equals(country.getIdCountry()) && c.getName().equals(country.getName()))
                throw new Exception("Nije moguce uneti dve drzave pod istim imenom.");
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
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
