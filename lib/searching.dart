import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductSearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<dynamic> _searchResults = [];

  void _searchProducts(BuildContext context, String searchTerm) async {
    // Make HTTP request to your PHP script
    String url =
        'https://tujengeane.co.ke/electronics/search.php?searchTerm=$searchTerm';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> results = json.decode(response.body);
      _searchResults.clear();
      _searchResults.addAll(results);
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load search results')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter product name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String searchTerm = _searchController.text;
                    if (searchTerm.isNotEmpty) {
                      _searchProducts(context, searchTerm);
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]['product_name']),
                  subtitle: Text(_searchResults[index]['description']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
