import 'package:ernes_technologies/categories.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      name: 'TVs',
      image: 'assets/images/tv.png',
    ),
    Category(
      name: 'Audio',
      image: 'assets/images/audio.png',
    ),
    Category(
      name: 'Computers',
      image: 'assets/images/computers.png',
    ),
    Category(
      name: 'Accessories',
      image: 'assets/images/accessories.png',
    ),
    Category(
      name: 'Gaming',
      image: 'assets/images/gaming.png',
    ),
    Category(
      name: 'Phones',
      image: 'assets/images/phones.png',
    ),
  ];

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
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
                  // prefixIcon: Icon(Icons.search),
                  suffixIcon: const SizedBox(
                    width: 100,
                    child: IntrinsicHeight(
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
                  )),
            ),
          ),
          const SizedBox(height: 16.0),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: categories.map((category) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(category: category),
                    ),
                  );
                },
                child: Card(
                  elevation: 2.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          category.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
