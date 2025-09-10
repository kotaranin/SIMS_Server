/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.City;
import domain.Country;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetCities extends AbstractSO {

    private List<City> cities;

    public List<City> getCities() {
        return cities;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Country country = (Country) parameter;
        cities = genericBroker.getAll(new City(), " JOIN country ON city.id_country = country.id_country WHERE country.id_country = " + country.getIdCountry());
    }

}
