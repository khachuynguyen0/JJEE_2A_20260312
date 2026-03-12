package com.jjee.servlet;

import com.jjee.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// ===============================
// Mon: Java JEE (Jakarta EE)
// Sinh vien: Nguyen Khac Huy
// Lop: 22DTHC1
// MSSV: 2280601183
// ===============================

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    // Danh sach san pham mau (gom it nhat 6 san pham, it nhat 2 danh muc)
    private List<Product> getProductList() {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Laptop Gaming", 35900000, 5, "Electronics", true));
        products.add(new Product(2, "Ban phim co", 1290000, 0, "Accessories", true));
        products.add(new Product(3, "Chuot khong day", 790000, 18, "Accessories", true));
        products.add(new Product(4, "Man hinh 27 inch", 4990000, 7, "Electronics", true));
        products.add(new Product(5, "Tai nghe", 990000, 12, "Accessories", false));
        products.add(new Product(6, "Dien thoai", 31900000, 2, "Electronics", true));
        return products;
    }

    // Xu ly GET: hien thi danh sach san pham
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> allProducts = getProductList();
        String filterCategory = request.getParameter("category");

        // Loc theo danh muc neu co tham so category
        List<Product> displayProducts;
        if (filterCategory != null && !filterCategory.isEmpty()) {
            List<Product> filtered = new ArrayList<>();
            for (Product p : allProducts) {
                if (p.getCategory().equalsIgnoreCase(filterCategory)) {
                    filtered.add(p);
                }
            }
            displayProducts = filtered;
            request.setAttribute("filterCategory", filterCategory);
        } else {
            displayProducts = allProducts;
        }
        request.setAttribute("products", displayProducts);

        // Tinh tong gia tri kho hang (price * quantity) tren danh sach hien thi
        double totalInventoryValue = 0;
        for (Product p : displayProducts) {
            totalInventoryValue += p.getPrice() * p.getQuantity();
        }
        request.setAttribute("totalInventoryValue", totalInventoryValue);

        // Dem so san pham con hang (quantity > 0) tren danh sach hien thi
        long inStockCount = displayProducts.stream().filter(p -> p.getQuantity() > 0).count();
        request.setAttribute("inStockCount", inStockCount);

        // Chuyen den trang JSP hien thi
        request.getRequestDispatcher("/views/product-list.jsp").forward(request, response);
    }
}
