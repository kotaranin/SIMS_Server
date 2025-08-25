/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.List;
import java.sql.Statement;
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
    public Long insert(AbstractDO parameter) throws Exception {
        String query = "INSERT INTO " + parameter.getTable() + " (" + parameter.getInsertColumns() + ") VALUES (" + parameter.getInsertParameters() + ")";
        System.out.println(query);
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        parameter.prepareStatement(preparedStatement);
        preparedStatement.executeUpdate();
        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        long id = -1;
        if (resultSet.next()) {
            id = resultSet.getInt(1);
        }
        resultSet.close();
        preparedStatement.close();
        return id;
    }

    @Override
    public void update(AbstractDO parameter) throws Exception {
        String query = "UPDATE " + parameter.getTable() + " SET " + parameter.getUpdateParameters() + " WHERE " + parameter.getPrimaryKey();
        System.out.println(query);
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        parameter.prepareStatement(preparedStatement);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    @Override
    public void delete(AbstractDO parameter) throws Exception {
        String query = "DELETE FROM " + parameter.getTable() + " WHERE " + parameter.getPrimaryKey();
        System.out.println(query);
        PreparedStatement preparedStatement = DBConnection.getInstance().getConnection().prepareStatement(query);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

}
