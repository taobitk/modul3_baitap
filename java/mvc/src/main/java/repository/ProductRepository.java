package repository;

import model.Product;

import java.util.ArrayList;

import java.util.List;

public  class ProductRepository {
    private static List<Product> products = new ArrayList<Product>();
    static {
        Product product1 = new Product(1, "Áo phông", 25000, 100);
        Product product2 = new Product(2, "Quần Jeans", 45000, 50);
        Product product3 = new Product(3, "Giày thể thao", 80000, 30);
        Product product4 = new Product(4, "Mũ lưỡi trai", 15000, 75);
        Product product5 = new Product(5, "Ba lô", 60000, 20);
        products.add(product1);
        products.add(product2);
        products.add(product3);
        products.add(product4);
        products.add(product5);
    }

    public static List<Product> getAll() {
        return products;
    }


    public static Product getById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public static void add(Product product) {
        int newId = getNextId();
        product.setId(newId);
        products.add(product);
    }

    private static int getNextId() {
        int maxId = 0;
        for (Product product : products) {
            if (product.getId() > maxId) {
                maxId = product.getId();
            }
        }
        return maxId + 1;
    }

    public static void update(Product updatedProduct) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == updatedProduct.getId()) {
                products.set(i, updatedProduct);
                return;
            }
        }
    }

    public static void delete(int id) {
        products.removeIf(p -> p.getId() == id);
    }
}