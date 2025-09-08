/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.Company;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllCompaniesSO extends AbstractSO {

    private List<Company> companies;

    public List<Company> getCompanies() {
        return companies;
    }

    @Override
    protected void conditions(Object parameter) throws Exception {
        if (parameter == null || !(parameter instanceof Company))
            throw new Exception("Sistem ne moze da vrati kompanije");
    }

    @Override
    protected void executeOperation(Object parameter) throws Exception {
        companies = genericBroker.getAll((Company) parameter, " JOIN city ON company.id_city = city.id_city "
                + "JOIN country ON city.id_country = country.id_country");
    }

}
