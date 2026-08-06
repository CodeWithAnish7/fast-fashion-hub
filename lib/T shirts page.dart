import 'package:flutter/material.dart';
import 'Cart Page.dart';

class TShirtPage extends StatelessWidget {
  const TShirtPage({super.key});

  final List<Map<String, String>> tshirts = const [
    {
      "name": "Oversized Black T-Shirt",
      "price": "₹499",
      "shop": "Blush With Us",
      "image": "https://chriscross.in/cdn/shop/files/blackOversizedtshirtChrisCross.jpg?v=1741783357&width=2048"
    },
    {
      "name": "White Cotton T-Shirt",
      "price": "₹399",
      "shop": "Fashion Factory",
      "image": "https://cottonworld.net/cdn/shop/files/L-TSHIRT-11670-21146-WHITE_2.jpg?v=1752670700"
    },
    {
      "name": "Printed Streetwear Tee",
      "price": "₹599",
      "shop": "Manjeet Collection",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf_q1F2eQYV9nTZNGN6kvpT25U1AbWhkMrqg&s"
    },
    {
      "name": "Graphic Oversized Tee",
      "price": "₹699",
      "shop": "V Mart",
      "image": "https://5.imimg.com/data5/ECOM/Default/2023/9/346787248/IO/AH/SD/40464902/cupid-6-5-c180e54d-442a-42a8-abae-12dba09d16a2-500x500.jpg"
    },
    {
      "name": "Plain Summer Tee",
      "price": "₹299",
      "shop": "Manglik Fashion",
      "image": "https://www.bonjourretail.com/cdn/shop/files/Artboard102_6e4e84a0-652e-47c7-bead-d58de646d17d.jpg?v=1758525122"
    },
    {
      "name": "Casual Round Neck Tee",
      "price": "₹549",
      "shop": "Sakshi Fashion",
      "image": "https://chriscross.in/cdn/shop/files/ChrisCrosscreamCottonTshirtformen_8d7a9c8a-8dd7-4b5f-b07a-47cfbd1fad98.jpg?v=1758276213&width=2048"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("T-Shirts"),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tshirts.length,

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
                )
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // IMAGE
                Stack(
                  children: [

                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        tshirts[index]["image"]!,
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
                          "20% OFF",
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
                          tshirts[index]["name"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          tshirts[index]["price"]!,
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
                              "4.8",
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
                                tshirts[index]["shop"]!,
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