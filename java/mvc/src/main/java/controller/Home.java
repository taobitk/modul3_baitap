package controller;

import model.Product;
import service.ProductServive;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/home")
public class Home extends HttpServlet {
    private List<Product> products = new ArrayList<>();
    private ProductServive productServive = new ProductServive();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/create-product.jsp").forward(req, resp);
                break;
            case "update":
                int idToUpdate = Integer.parseInt(req.getParameter("id"));
                req.getRequestDispatcher("/view/update-product.jsp").forward(req, resp);
                break;

            default:

                products = productServive.getAllProduct();
                req.setAttribute("products", products);
                req.getRequestDispatcher("/view/home.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                int price = Integer.parseInt(req.getParameter("price"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                Product product = new Product(name, price, quantity);
                productServive.addProduct(product);
                resp.sendRedirect("/home");
                break;
            case "delete":
                int idToDelete = Integer.parseInt(req.getParameter("id"));
                productServive.deleteProduct(idToDelete);
                resp.sendRedirect("/home");
                break;
            case "update":
                break;
        }
    }
}