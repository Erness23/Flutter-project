import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductScreen extends StatelessWidget {
  final String category;

  const ProductScreen({super.key, required this.category});

  Future<List<Product>> _fetchProducts(int page, int pageSize) async {
    final response = await http.get(
      Uri.parse(
          'YOUR_SERVER_URL/products.php?category=$category&page=$page&pageSize=$pageSize'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ProductList(category: category),
    );
  }
}

class ProductList extends StatelessWidget {
  final String category;

  ProductList({required this.category});

  Future<void> _loadMoreProducts(
      BuildContext context,
      int page,
      int pageSize,
      List<Product> products,
      void Function(List<Product>) updateProducts) async {
    final response = await http.get(
      Uri.parse(
          'YOUR_SERVER_URL/products.php?category=$category&page=$page&pageSize=$pageSize'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> fetchedProducts =
          data.map((item) => Product.fromJson(item)).toList();
      updateProducts([...products, ...fetchedProducts]);
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProductListView(
      loadMoreProducts: _loadMoreProducts,
      category: category,
    );
  }
}

class ProductListView extends StatefulWidget {
  final Future<void> Function(
      BuildContext context,
      int page,
      int pageSize,
      List<Product> products,
      void Function(List<Product>) updateProducts) loadMoreProducts;
  final String category;

  ProductListView({required this.loadMoreProducts, required this.category});

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  late int _page;
  late int _pageSize;
  late List<Product> _products;
  late bool _isLoading;
  late List<Product> _cart;

  @override
  void initState() {
    super.initState();
    _page = 1;
    _pageSize = 10; 
    _products = [];
    _isLoading = false;
    _cart = []; 
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    await widget.loadMoreProducts(context, _page, _pageSize, _products,
        (newProducts) {
      setState(() {
        _products = newProducts;
        _isLoading = false;
      });
    });
  }

  Future<void> _loadMoreProducts() async {
    setState(() {
      _page++;
    });
    await _fetchProducts();
  }

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _products.length + 1, 
            itemBuilder: (context, index) {
              if (index == _products.length) {
                return _buildLoadMoreButton();
              } else {
                return ListTile(
                  title: Text(_products[index].name),
                  subtitle:
                      Text('\$${_products[index].price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          _addToCart(_products[index]);
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          );
  }

  Widget _buildLoadMoreButton() {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : TextButton(
            onPressed: _loadMoreProducts,
            child: Text('Load More'),
          );
  }
}

class Product {
  final String name;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
    );
  }
}
