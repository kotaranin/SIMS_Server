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
public class SearchCompany extends AbstractSO {

    private List<Company> companies;

    public List<Company> getCompanies() {
        return companies;
    }

    @Override
    protected void validate(AbstractDO parameter) throws Exception {
    }

    @Override
    protected void executeOperation(AbstractDO parameter) throws Exception {
        Company company = (Company) parameter;
        String condition = " JOIN city ON company.id_city = city.id_city "
                + "WHERE 1 = 1 ";
        if (company.getName() != null && !company.getName().isEmpty())
            condition += "AND LOWER(company.name) LIKE '%" + company.getName().toLowerCase() + "%' ";
        if (company.getAddress() != null && !company.getAddress().isEmpty())
            condition += "AND LOWER(company.address) LIKE '%" + company.getAddress().toLowerCase() + "%' ";
        if (company.getCity() != null && company.getCity().getIdCity() != null)
            condition += "AND city.id_city = " + company.getCity().getIdCity();
        companies = genericBroker.getAll(company, condition);
    }

}
