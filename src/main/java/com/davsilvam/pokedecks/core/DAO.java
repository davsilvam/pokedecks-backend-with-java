package com.davsilvam.pokedecks.core;

import java.sql.SQLException;
import java.util.List;

public interface DAO<E, ID> {
    E save(E entity) throws SQLException;

    E findById(ID id) throws SQLException;

    List<E> findAll() throws SQLException;

    boolean existsById(ID id) throws SQLException;

    int count() throws SQLException;

    void deleteById(ID id) throws SQLException;
}
