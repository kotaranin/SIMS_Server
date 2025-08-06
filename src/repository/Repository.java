/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;

import java.util.List;

/**
 *
 * @author kotar
 */
public interface Repository<T> {

    public List<T> getAll(T parameter, String condition) throws Exception;

    public List<T> getAll();

    public void insert(T paramater) throws Exception;

    public void update(T paramater) throws Exception;

    public void delete(T paramater) throws Exception;

}
