import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  int price = 499;

  @override
  Widget build(BuildContext context) {
    int total = quantity * price;

    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("My Cart"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            Container(
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
                children: [

                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),

                    child: Image.network(
                      "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTnKOsuoaXNUz9ewnWkg7TeAgWta-52SjHgFQOEhWx5S1ZPVoTyFJ_XfkXF0YeGS7ac4kDB18ZpCUag5EaXJzf1NlHXZA8NaQwoOykhTJ3ecw_n4ezVacqvXg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "Oversized Black T-Shirt",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Dukan Number 1",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "₹$price",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [

                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove_circle),
                                ),

                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add_circle),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "₹$total",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),

                      onPressed: () {

                      },

                      child: const Text(
                        "Proceed to Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}