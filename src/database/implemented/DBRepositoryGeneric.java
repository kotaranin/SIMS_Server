/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database.implemented;

import database.DBConnectionFactory;
import database.DBRepository;
import domain.AbstractDomainObject;
import java.util.List;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author kotar
 */
public class DBRepositoryGeneric implements DBRepository<AbstractDomainObject> {

    @Override
    public List<AbstractDomainObject> getAll(AbstractDomainObject parameter, String condition) throws Exception {
        String query = "SELECT * FROM " + parameter.getTable();
        if (condition != null) {
            query += " WHERE " + condition;
        }
        System.out.println(query);
        Statement statement = DBConnectionFactory.getInstance().getConnection().createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        List<AbstractDomainObject> list = parameter.getList(resultSet);
        resultSet.close();
        statement.close();
        return list;
    }

    @Override
    public List<AbstractDomainObject> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(AbstractDomainObject parameter) throws Exception {
        String query = "INSERT INTO " + parameter.getTable() + " (" + parameter.getInsertColumns() + ") VALUES (" + parameter.getInsertValues() + ")";
        System.out.println(query);
        Statement statement = DBConnectionFactory.getInstance().getConnection().createStatement();
        statement.executeUpdate(query);
        statement.close();
    }

    @Override
    public void update(AbstractDomainObject parameter) throws Exception {
        String query = "UPDATE " + parameter.getTable() + " SET " + parameter.getUpdateValues() + " WHERE " + parameter.getPrimaryKey();
        System.out.println(query);
        Statement statement = DBConnectionFactory.getInstance().getConnection().createStatement();
        statement.executeUpdate(query);
        statement.close();
    }

    @Override
    public void delete(AbstractDomainObject parameter) throws Exception {
        String query = "DELETE FROM " + parameter.getTable() + " WHERE " + parameter.getPrimaryKey();
        System.out.println(query);
        Statement statement = DBConnectionFactory.getInstance().getConnection().createStatement();
        statement.executeUpdate(query);
        statement.close();
    }

}
