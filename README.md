# JJEE_2A_20260312

> Mon: Java JEE (Jakarta Enterprise Edition)  
> Sinh vien: Nguyen Khac Huy | Lop: 22DTHC1 | MSSV: 2280601183  
> Ngay: 2026-03-12

## Mo ta

Bai tap thuc hanh Java JEE (Jakarta EE) – Ung dung Web quan ly San pham su dung Servlet va JSP.

## Cau truc du an

```
JJEE_2A_20260312/
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   └── com/jjee/
        │       ├── model/
        │       │   └── Product.java       # Model san pham
        │       └── servlet/
        │           └── ProductServlet.java # Servlet xu ly yeu cau
        └── webapp/
            ├── index.jsp                  # Trang chu (tu dong chuyen huong)
            ├── views/
            │   └── product-list.jsp       # Trang hien thi danh sach san pham
            └── WEB-INF/
                └── web.xml                # Cau hinh ung dung web
```

## Chuc nang

- Hien thi danh sach san pham (id, ten, gia, so luong, danh muc, trang thai)
- Loc san pham theo danh muc (Electronics / Accessories)
- Thong ke: tong so san pham, so san pham con hang, tong gia tri kho hang

## Cach chay

1. Cai dat [Apache Tomcat 10+](https://tomcat.apache.org/) va [Maven](https://maven.apache.org/)
2. Build du an:
   ```bash
   mvn clean package
   ```
3. Deploy file `target/JJEE_2A_20260312.war` vao Tomcat
4. Truy cap `http://localhost:8080/JJEE_2A_20260312/`
