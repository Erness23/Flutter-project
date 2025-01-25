import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/payment_option_tile.dart';
import '../widgets/popular_products_carousel.dart';
import '../widgets/product_tile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ERNES ELECTRONICS",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                    ),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    Text(
                      "Hey Ernest,",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.11),
                      blurRadius: 40,
                      spreadRadius: 0.0,
                    )
                  ]),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Search for products...",
                      suffixIcon: Container(
                        width: 100,
                        child: const IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VerticalDivider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 10,
                                thickness: 0.1,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Icon(Icons.search),
                              ),
                            ],
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Text("Payment Options"),
                const SizedBox(height: 10),
                CarouselSlider(
                  items: const [
                    PaymentOptionTile(
                      icon: Icons.credit_card,
                      title: 'Credit Card',
                    ),
                    PaymentOptionTile(
                      icon: Icons.payment,
                      title: 'PayPal',
                    ),
                    PaymentOptionTile(
                      icon: Icons.monetization_on,
                      title: 'Cash on Delivery',
                    ),
                    // Add more payment option tiles as needed
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Popular Products"),
                const SizedBox(height: 10),
                const PopularProductsCarousel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
