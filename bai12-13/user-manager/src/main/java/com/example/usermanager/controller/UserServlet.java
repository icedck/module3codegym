package com.example.usermanager.controller;

import com.example.usermanager.model.User;
import com.example.usermanager.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(req, resp);
                    break;
                case "edit":
                    updateUser(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
            }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(id, name, email, country);
//        userDAO.updateUser(user);
        userDAO.updateUserWithStoredProcedure(user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        String add = request.getParameter("add");
        String edit = request.getParameter("edit");
        String delete = request.getParameter("delete");
        String view = request.getParameter("view");
        List<Integer> permissions = new ArrayList<>();
        if (add != null){
            permissions.add(1);
        }
        if (edit != null){
            permissions.add(2);
        }
        if (delete != null){
            permissions.add(3);
        }
        if (view != null){
            permissions.add(4);
        }

        User newUser = new User(name, email, country);
        //userDAO.insertUser(newUser);
        userDAO.addUserTransaction(newUser, permissions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deleteUser(req, resp);
                    break;
                case "search":
                    searchUserByCountry(req, resp);
                    break;
                case "sort":
                    sortUsersByName(req, resp);
                    break;
                case "test-without-tran":
                    testWithoutTran(req, resp);
                    break;
                case "test-use-tran":
                    testUseTran(req, resp);
                    break;

                default:
                    listUsers(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void testUseTran(HttpServletRequest req, HttpServletResponse resp) {
        userDAO.insertUpdateUseTransaction();
    }

    private void testWithoutTran(HttpServletRequest req, HttpServletResponse resp) {
        userDAO.insertUpdateWithoutTransaction();
    }

    private void sortUsersByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        List<User> listUsers = userDAO.sortUsersByName();
        req.setAttribute("listUser", listUsers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void searchUserByCountry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String country  = req.getParameter("country");
        List<User> listUsers = userDAO.searchUsersByCountry(country);
        req.setAttribute("listUser", listUsers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<User> listUsers = userDAO.selectAllUsers();
        List<User> listUsers = userDAO.getAllUsersWithStoredProcedure();
        req.setAttribute("listUser", listUsers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
//        userDAO.deleteUser(id);
        userDAO.deleteUserWithStoredProcedure(id);

        List<User> listUsers = userDAO.selectAllUsers();
        req.setAttribute("listUser", listUsers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(req,resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User existingUser = userDAO.getUserById(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/edit.jsp");
        req.setAttribute("user", existingUser);
        dispatcher.forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(req, resp);
    }
}
