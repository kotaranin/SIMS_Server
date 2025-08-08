/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package database;

/**
 *
 * @author kotar
 */
public interface DBOperations<T> extends AbstractBroker<T> {

    default public void connect() {
        DBConnection.getInstance().getConnection();
    }

    default public void disconnect() throws Exception {
        DBConnection.getInstance().getConnection().close();
    }

    default public void commit() throws Exception {
        DBConnection.getInstance().getConnection().commit();
    }

    default public void rollback() throws Exception {
        DBConnection.getInstance().getConnection().rollback();
    }
}
