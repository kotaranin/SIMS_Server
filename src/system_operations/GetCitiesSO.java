/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.City;
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
        if (parameter == null || !(parameter instanceof City)) {
            throw new Exception("Sistem ne moze da vrati sve gradove.");
        }
    }

    @Override
    protected void executeOperation(Object parameter, String condition) throws Exception {
        cities = genericBroker.getAll((City) parameter, condition);
    }

}
