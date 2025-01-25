import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ernes_technologies/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopularProductsCarousel extends StatelessWidget {
  const PopularProductsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchPopularProductImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return CarouselSlider(
            items: snapshot.data!
                .map((imagePath) => ProductTile(imagePath: imagePath))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }

  Future<List<String>> fetchPopularProductImages() async {
    final response = await http
        .get(Uri.parse('https://tujengeane.co.ke/electronics/getProducts.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map<String>((item) => item['imagePath'] as String).toList();
    } else {
      throw Exception('Failed to load popular product images');
    }
  }
}
