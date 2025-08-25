/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package database;

import java.util.List;

/**
 *
 * @author kotar
 */
public interface AbstractBroker<T> {

    public List<T> getAll(T parameter, String condition) throws Exception;

    public List<T> getAll();

    public Long insert(T paramater) throws Exception;
    
    public void update(T paramater) throws Exception;

    public void delete(T paramater) throws Exception;

}
