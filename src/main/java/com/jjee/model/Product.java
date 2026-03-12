package com.jjee.model;

// ===============================
// Mon: Java JEE (Jakarta EE)
// Sinh vien: Nguyen Khac Huy
// Lop: 22DTHC1
// MSSV: 2280601183
// ===============================

// De bai: San pham (Product) gom cac thuoc tinh:
// id, name, price, quantity, category, isAvailable (true/false)

public class Product {

    private int id;
    private String name;
    private double price;
    private int quantity;
    private String category;
    private boolean isAvailable;

    public Product() {}

    public Product(int id, String name, double price, int quantity, String category, boolean isAvailable) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.isAvailable = isAvailable;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }

    @Override
    public String toString() {
        return "Product{id=" + id + ", name='" + name + "', price=" + price
                + ", quantity=" + quantity + ", category='" + category
                + "', isAvailable=" + isAvailable + "}";
    }
}
