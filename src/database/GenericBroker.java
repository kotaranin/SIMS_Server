/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import domain.AbstractDO;

/**
 *
 * @author kotar
 */
public class GenericBroker implements DBOperations<AbstractDO> {

    @Override
    public List<AbstractDO> getAll(AbstractDO parameter, String condition) throws Exception {
        String query = "SELECT * FROM " + parameter.getTable();
        if (condition != null) {
            query += " " + condition;
        }
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<AbstractDO> list = parameter.getList(resultSet);
        resultSet.close();
        preparedStatement.close();
        return list;
    }

    @Override
    public List<AbstractDO> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(AbstractDO parameter) throws Exception {
        String query = "INSERT INTO " + parameter.getTable() + " (" + parameter.getInsertParameters() + ") VALUES (" + parameter.getInsertParameters() + ")";
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        parameter.prepareInsertStatement(preparedStatement);
        preparedStatement.executeUpdate(query);
        preparedStatement.close();
    }

    @Override
    public void update(AbstractDO parameter) throws Exception {
        String query = "UPDATE " + parameter.getTable() + " SET " + parameter.getUpdateParameters() + " WHERE " + parameter.getPrimaryKey();
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        parameter.prepareUpdateStatement(preparedStatement);
        preparedStatement.executeUpdate(query);
        preparedStatement.close();
    }

    @Override
    public void delete(AbstractDO parameter) throws Exception {
        String query = "DELETE FROM " + parameter.getTable() + " WHERE " + parameter.getPrimaryKey();
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        preparedStatement.executeUpdate(query);
        preparedStatement.close();
    }

}
