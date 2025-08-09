/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package system_operations;

import database.AbstractBroker;
import database.DBOperations;
import database.GenericBroker;

/**
 *
 * @author kotar
 */
public abstract class AbstractSO {

    protected final AbstractBroker genericBroker;

    public AbstractSO() {
        this.genericBroker = new GenericBroker();
    }

    public final void execute(Object parameter, String condition) throws Exception {
        try {
            conditions(parameter);
            connect();
            executeOperation(parameter, condition);
            commit();
        } catch (Exception ex) {
            rollback();
            throw ex;
        } finally {
            disconnect();
        }
    }

    protected abstract void conditions(Object parameter) throws Exception;

    protected abstract void executeOperation(Object parameter, String condition) throws Exception;

    private void connect() {
        ((DBOperations) genericBroker).connect();
    }

    private void commit() throws Exception {
        ((DBOperations) genericBroker).commit();
    }

    private void rollback() throws Exception {
        ((DBOperations) genericBroker).rollback();
    }

    private void disconnect() throws Exception {
        ((DBOperations) genericBroker).disconnect();
    }

}
