package controller;

import model.Product;
import repository.ProductRepository;

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
    private  List<Product> products = new ArrayList<>(); // Instance variable

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
                Product productToUpdate = ProductRepository.getById(idToUpdate);

                req.setAttribute("product", productToUpdate);
                req.getRequestDispatcher("/view/update-product.jsp").forward(req, resp);
                break;

            default:
                products = ProductRepository.getAll(); // Lấy từ repository, không phải instance variable
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
        switch (action){
            case "create":

                String name = req.getParameter("name");
                int price = Integer.parseInt(req.getParameter("price"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));


                Product newProduct = new Product();
                newProduct.setName(name);
                newProduct.setPrice(price);
                newProduct.setQuantity(quantity);

                ProductRepository.add(newProduct);

                resp.sendRedirect("/home");
                break;
            case "delete":
                int idToDelete = Integer.parseInt(req.getParameter("id"));
                ProductRepository.delete(idToDelete);
                resp.sendRedirect("/home"); //
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String nameUpdate = req.getParameter("name");
                int priceUpdate = Integer.parseInt(req.getParameter("price"));
                int quantityUpdate = Integer.parseInt(req.getParameter("quantity"));
                Product updatedProduct = new Product(id, nameUpdate, priceUpdate, quantityUpdate);
                ProductRepository.update(updatedProduct);
                resp.sendRedirect("/home");
                break;
        }
    }
}