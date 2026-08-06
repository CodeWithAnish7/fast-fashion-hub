import 'package:flutter/material.dart';
import 'Cart Page.dart';

class MangalikFashionPage extends StatelessWidget {
  const MangalikFashionPage({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Designer Kurti",
      "price": "₹799",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSStNQSMPtj--NDTzniMvYiGYM2woYazxBtJQ&s"
    },
    {
      "name": "Printed Saree",
      "price": "₹1299",
      "image": "https://mysilklove.com/cdn/shop/products/MSLJ1-0000.jpg?v=1649657664&width=2048"
    },
    {
      "name": "T shirt Pant Set",
      "price": "₹999",
      "image": "https://assets.ajio.com/medias/sys_master/root/20240620/VQI2/66735a471d763220fad5421f/-473Wx593H-700107095-black-MODEL.jpg"
    },
    {
      "name": "Anarkali Suit",
      "price": "₹1499",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8f1c6Rmwz4eYbL22DqMWpdfcdbcmxbwZruw&s"
    },
    {
      "name": "Party Wear Gown",
      "price": "₹1899",
      "image": "https://images.meesho.com/images/products/595771995/8un0y_512.webp?width=512"
    },
    {
      "name": "Casual Top",
      "price": "₹599",
      "image": "https://imagescdn.pantaloons.com/img/app/product/1/1018062-13875264.jpg?auto=format&w=450"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Mangalik Fashion"),
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
                )
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
                              "4.8",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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