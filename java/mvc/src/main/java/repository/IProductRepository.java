package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
   List<Product>  getAll();
   Product getById(int id);
   void add(Product product);
   void update(Product product);
   void delete(int id);
}
