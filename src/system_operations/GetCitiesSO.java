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
public class GetCitiesSO extends AbstractSO {

    private List<City> cities;

    public List<City> getCities() {
        return cities;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Country)) {
            throw new Exception("Sistem ne moze da vrati sve gradove.");
        }
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        Country country = (Country) parameter;
        cities = genericBroker.getAll(new City(), " JOIN country ON city.id_country = country.id_country WHERE country.id_country = " + country.getIdCountry());
    }

}
