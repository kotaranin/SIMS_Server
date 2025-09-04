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
        if (parameter == null || !(parameter instanceof Country)) {
            throw new Exception("Sistem ne moze da zapamti drzavu.");
        }
        Country country = (Country) parameter;
        if (country.getName() == null || country.getName().isEmpty()) {
            throw new Exception("Sistem ne moze da zapamti drzavu.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
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
