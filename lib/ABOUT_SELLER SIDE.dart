import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffF8F4EE),

        appBar: AppBar(

          elevation: 0,

          backgroundColor: const Color(0xffF8F4EE),

          centerTitle: true,

          iconTheme: const IconThemeData(
            color: Color(0xff6D4C41),
          ),

          title: const Text(

            "About App",

            style: TextStyle(
              color: Color(0xff6D4C41),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

          ),

        ),

        body: ListView(

            padding: const EdgeInsets.all(16),

            children: [

        Container(

        padding: const EdgeInsets.all(20),

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

        child: const Column(

            children: [
          CircleAvatar(
          radius: 45,
          backgroundColor: Color(0xffF3E5E1),
          child: Icon(
            Icons.storefront,
            size: 50,
            color: Color(0xff6D4C41),
          ),
        ),

      SizedBox(height: 18),

      Text(
        "Stitch Swift Seller",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff6D4C41),
        ),
      ),

      SizedBox(height: 8),

      Text(
        "Version 1.0.0",
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),

      SizedBox(height: 22),

      Divider(),

      SizedBox(height: 20),

      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "About",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff6D4C41),
          ),
        ),
      ),

      SizedBox(height: 10),

      Text(
        "Stitch Swift Seller is a smart platform designed for local clothing shop owners. It helps sellers manage products, receive orders, create offers, update shop details, and grow their business through an easy-to-use mobile application.",
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.7,
        ),
      ),

      SizedBox(height: 22),
              const Divider(),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Key Features",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6D4C41),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Row(
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text("Product Management"),
                ],
              ),

              SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text("Order Management"),
                ],
              ),

              SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text("Offers & Coupons"),
                ],
              ),

              SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text("Shop Profile"),
                ],
              ),

              SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text("Real-time Notifications"),
                ],
              ),

              const SizedBox(height: 24),

              Divider(),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Developed By",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6D4C41),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Stitch Swift Team",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 24),

              Divider(),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6D4C41),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Row(
                children: [
                  Icon(Icons.email,
                      color: Color(0xff6D4C41)),
                  SizedBox(width: 10),
                  Text("support@stitchswift.com"),
                ],
              ),

              SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.language,
                      color: Color(0xff6D4C41)),
                  SizedBox(width: 10),
                  Text("www.stitchswift.com"),
                ],
              ),

              const SizedBox(height: 24),

              Divider(),

              const SizedBox(height: 20),

              const Text(
                "© 2026 Stitch Swift. All Rights Reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.6,
                ),
              ),

            ],
        ),
        ),

            ],
        ),
    );
  }
}