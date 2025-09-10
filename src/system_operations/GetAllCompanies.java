/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import domain.AbstractDO;
import domain.Company;
import java.util.List;

/**
 *
 * @author kotar
 */
public class GetAllCompanies extends AbstractSO {

    private List<Company> companies;

    public List<Company> getCompanies() {
        return companies;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        companies = genericBroker.getAll((Company) parameter, " JOIN city ON company.id_city = city.id_city "
                + "JOIN country ON city.id_country = country.id_country");
    }

}
