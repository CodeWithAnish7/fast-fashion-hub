import 'package:flutter/material.dart';
import 'Cart Page.dart';

class MensPage extends StatelessWidget {
  const MensPage({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Slim Fit Shirt",
      "price": "₹799",
      "shop": "American Connection",
      "image": "https://5.imimg.com/data5/IB/YL/MY-552852/men-slim-fit-shirt.jpg"
    },
    {
      "name": "Casual Jeans",
      "price": "₹1299",
      "shop": "For Men",
      "image": "https://littleboxindia.com/cdn/shop/files/Men_s_Casual_Street_Flap_Pocket_Loose_Straight_Leg_Cargo_Denim_Jeans_Plain_Long_Distressed_Straight_Leg_Cargo_Light_Blue.jpg?v=1742193836"
    },
    {
      "name": "Formal Shirt",
      "price": "₹999",
      "shop": "Jade Blue Menswear",
      "image": "https://sylora.in/cdn/shop/files/men-sky-blue-formal-cotton-shirt.webp?v=1767353987"
    },
    {
      "name": "Denim Jacket",
      "price": "₹1499",
      "shop": "Dulhe Raja Collection",
      "image": "https://www.richlook.in/cdn/shop/files/img_212.jpg?v=1765954650"
    },
    {
      "name": "Cargo Pants",
      "price": "₹899",
      "shop": "The Raymond Shop",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltdnohMIkjUc-RQxn7unNsWkdQJxppuZ6qg&s"
    },
    {
      "name": "Premium Hoodie",
      "price": "₹1199",
      "shop": "V Mart",
      "image": "https://nobero.com/cdn/shop/files/be-fearless_ed3fc478-d354-42ed-9353-2f252f145b2a.jpg?v=1760172891"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Men Wear"),
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
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "25% OFF",
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
                              "4.7",
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
                              backgroundColor: Colors.black,
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