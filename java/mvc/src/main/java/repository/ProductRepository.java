package repository;

import connect.BaseRepository;
import model.Product;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public  class ProductRepository {
    private static final String SELECT_ALL ="select * from products";
    private static final String INSERT_INTO ="insert into products(name,price,quantity) values (?,?,?)";
    private static final String DELETE_FROM_ID ="delete from products where id=?";

    public static List<Product> getAll() {
        List<Product> products = new ArrayList<Product>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {

               int id = resultSet.getInt("id");
               String name = resultSet.getString("name");
               int price = resultSet.getInt("price");
               int quantity = resultSet.getInt("quantity");
               Product product = new Product(id, name, price, quantity);
               products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static void add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("thêm mới thất bại");
        }

    }


    public static void update(Product updatedProduct) {

    }

    public static void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}