package com.example.usermanager.service;

import com.example.usermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUsers();
    public boolean updateUser(User user) throws SQLException;
    public boolean deleteUser(int id) throws SQLException;
    public List<User> searchUsersByCountry(String country);
    public List<User> sortUsersByName();

    public User getUserById(int id);
    public void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, List<Integer> permission);

    public void insertUpdateWithoutTransaction();

    public void insertUpdateUseTransaction();

    public List<User> getAllUsersWithStoredProcedure();

    public boolean updateUserWithStoredProcedure(User user) throws SQLException;

    public boolean deleteUserWithStoredProcedure(int id) throws SQLException;
}
