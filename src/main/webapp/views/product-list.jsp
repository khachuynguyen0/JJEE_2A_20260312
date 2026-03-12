<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sach San pham - JJEE 2A</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .header h1 { margin: 0; font-size: 22px; }
        .header p  { margin: 4px 0 0; font-size: 13px; opacity: 0.8; }
        .stats {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        .stat-card {
            background: white;
            border-radius: 8px;
            padding: 15px 20px;
            flex: 1;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        .stat-card h3 { margin: 0 0 8px; font-size: 13px; color: #777; }
        .stat-card p  { margin: 0; font-size: 20px; font-weight: bold; color: #2c3e50; }
        .filter-bar {
            margin-bottom: 15px;
        }
        .filter-bar a {
            display: inline-block;
            padding: 6px 14px;
            margin-right: 6px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 13px;
            background: #ddd;
            color: #333;
        }
        .filter-bar a.active { background: #2c3e50; color: white; }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-size: 13px;
        }
        td {
            padding: 10px 15px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background-color: #f9f9f9; }
        .badge {
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
        }
        .badge-available   { background: #d4edda; color: #155724; }
        .badge-unavailable { background: #f8d7da; color: #721c24; }
        .badge-instock     { background: #cce5ff; color: #004085; }
        .badge-outstock    { background: #ffeeba; color: #856404; }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: #999;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Quan ly San pham - Java JEE</h1>
    <p>Sinh vien: Nguyen Khac Huy | Lop: 22DTHC1 | MSSV: 2280601183 | Ngay: 2026-03-12</p>
</div>

<!-- Thong ke -->
<div class="stats">
    <div class="stat-card">
        <h3>Tong so san pham</h3>
        <p>${products.size()}</p>
    </div>
    <div class="stat-card">
        <h3>San pham con hang</h3>
        <p>${inStockCount}</p>
    </div>
    <div class="stat-card">
        <h3>Tong gia tri kho hang</h3>
        <p><fmt:formatNumber value="${totalInventoryValue}" type="currency" currencySymbol="VND " maxFractionDigits="0"/></p>
    </div>
</div>

<!-- Bo loc danh muc -->
<div class="filter-bar">
    <strong>Loc theo danh muc:</strong>
    <a href="products" class="${empty filterCategory ? 'active' : ''}">Tat ca</a>
    <a href="products?category=Electronics" class="${filterCategory == 'Electronics' ? 'active' : ''}">Electronics</a>
    <a href="products?category=Accessories" class="${filterCategory == 'Accessories' ? 'active' : ''}">Accessories</a>
</div>

<!-- Bang danh sach san pham -->
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Ten san pham</th>
            <th>Gia (VND)</th>
            <th>So luong</th>
            <th>Danh muc</th>
            <th>Trang thai ban</th>
            <th>Ton kho</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td><fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/></td>
                <td>${p.quantity}</td>
                <td>${p.category}</td>
                <td>
                    <c:choose>
                        <c:when test="${p.available}">
                            <span class="badge badge-available">Dang ban</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-unavailable">Ngung ban</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${p.quantity > 0}">
                            <span class="badge badge-instock">Con hang</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-outstock">Het hang</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="footer">
    <p>JJEE_2A_20260312 &mdash; Java Jakarta EE Web Application</p>
</div>

</body>
</html>
