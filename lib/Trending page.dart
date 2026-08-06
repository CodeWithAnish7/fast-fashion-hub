import 'package:flutter/material.dart';
import 'Cart Page.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Trending Oversized Tee",
      "price": "₹699",
      "shop": "Sanjeet Collection",
      "image": "https://m.media-amazon.com/images/I/71bncVVabeL._AC_UY1100_.jpg"
    },
    {
      "name": "Spring OutFit",
      "price": "₹1999",
      "shop": "V Mart",
      "image": "https://cdn.shopify.com/s/files/1/0797/2284/0358/files/Trending_Spring_Outfits_For_Women_480x480.webp?v=1710409060"
    },
    {
      "name": "Stylish Hoodie",
      "price": "₹1299",
      "shop": "Gopi Collection",
      "image": "https://m.media-amazon.com/images/I/61UfgrGTCQL._AC_UY1100_.jpg"
    },
    {
      "name": "Denim Jacket",
      "price": "₹1599",
      "shop": "Shop Number 4",
      "image": "https://rukminim2.flixcart.com/image/480/640/xif0q/jacket/y/1/n/l-no-rds-dn-w-145-blue-roadster-original-imah8s7kaqrzhbm7.jpeg?q=90"
    },
    {
      "name": "Cargo Pants",
      "price": "₹999",
      "shop": "V Mart",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJpg-O2NoxQa42DMaTqx7iJiieWdkqbwoblw&s"
    },
    {
      "name": "Trending Saree",
      "price": "₹2499",
      "shop": "Mukesh Saree Wale",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLeDVQ-PKmwLp-bB5QojPrFHARSwriMQsZ4Q&s"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Trending"),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.58,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        products[index]["image"]!,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "TRENDING",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]["name"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          products[index]["price"]!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "5.0",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            const Icon(
                              Icons.store,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                products[index]["shop"]!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          height: 38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}