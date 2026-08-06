import 'package:flutter/material.dart';
import 'Cart Page.dart';

class WomenPage extends StatelessWidget {
  const WomenPage({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Floral Kurti",
      "price": "₹899",
      "shop": "Fashion Factory",
      "image": "https://anayadesignerstudio.com/cdn/shop/files/Multicolor_Floral_Kurti_Set_for_Wedding_Celebrations.webp?v=1742561982"
    },
    {
      "name": "Designer Saree",
      "price": "₹1399",
      "shop": "Manjeet Collection",
      "image": "https://mahezon.in/cdn/shop/files/Designer_Embroidery_Fancy_Red_Party_wear_Women_s_Saree_1200x1200.png?v=1740750260"
    },
    {
      "name": "Casual Top",
      "price": "₹599",
      "shop": "TBFO",
      "image": "https://blanc9.com/cdn/shop/files/Black_Cotton_Puffed_Sleeves_Top.jpg?v=1757412126"
    },
    {
      "name": "Long Gown",
      "price": "₹1999",
      "shop": "Paras LifeLine",
      "image": "https://hyderabad.ksethnic.com/blouse/2024/01/WhatsApp-Image-2024-01-02-at-11.59.27-AM.jpeg"
    },
    {
      "name": "Cotton Palazzo Set",
      "price": "₹999",
      "shop": "Shree SUBH LABH",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Up6yvgY6I5ECMKh3oQz4A3D-MqOPDCqpBw&s"
    },
    {
      "name": "Shorts",
      "price": "₹799",
      "shop": "Angrezi Cloths",
      "image": "https://media.landmarkshops.in/cdn-cgi/image/h=831,w=615,q=85,fit=cover/max-new/1000015518687-Blue-LIGHTBLUE-1000015518687_01-2100.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Women Wear"),
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
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "30% OFF",
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
                              "4.9",
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
                              backgroundColor: Colors.pink,
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