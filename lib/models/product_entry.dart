// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String description;
    String category;
    String? thumbnail;
    bool isFeatured;
    int stock;
    String? brand;
    DateTime createdAt;
    int productViews;
    int? userId;
    String? username;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        this.thumbnail,
        required this.isFeatured,
        required this.stock,
        this.brand,
        required this.createdAt,
        required this.productViews,
        this.userId,
        this.username,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        brand: json["brand"],
        createdAt: DateTime.parse(json["created_at"]),
        productViews: json["product_views"],
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "stock": stock,
        "brand": brand,
        "created_at": createdAt.toIso8601String(),
        "product_views": productViews,
        "user_id": userId,
        "username": username,
    };
}