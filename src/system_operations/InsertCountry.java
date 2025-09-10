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
public class InsertCountry extends AbstractSO {

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
            if (c.getName().equals(country.getName()))
                throw new Exception("Nije moguće uneti dve države pod istim imenom.");
        }
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
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
