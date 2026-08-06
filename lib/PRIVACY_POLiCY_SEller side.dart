import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffF8F4EE),

        appBar: AppBar(

          backgroundColor: const Color(0xffF8F4EE),

          elevation: 0,

          centerTitle: true,

          iconTheme: const IconThemeData(
            color: Color(0xff6D4C41),
          ),

          title: const Text(

            "Privacy Policy",

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

        padding: const EdgeInsets.all(18),

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

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
          Text(
          "Information We Collect",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff6D4C41),
          ),
        ),

      SizedBox(height: 10),

      Text(
        "• Shop Name\n"
            "• Owner Name\n"
            "• Mobile Number\n"
            "• Email Address\n"
            "• Shop Address\n"
            "• Product Details\n"
            "• Order Information",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.6,
        ),
      ),

      SizedBox(height: 24),

      Divider(),

      SizedBox(height: 20),

      Text(
        "How We Use Your Information",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff6D4C41),
        ),
      ),

      SizedBox(height: 10),

      Text(
        "We use your information to manage your seller account, process customer orders, verify your shop, improve app performance, provide customer support, and send important updates related to your business.",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.6,
        ),
      ),

      SizedBox(height: 24),

      Divider(),

      SizedBox(height: 20),

      Text(
        "Data Security",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff6D4C41),
        ),
      ),

      SizedBox(height: 10),

      Text(
        "We take reasonable security measures to protect your personal information. Your seller data is stored securely and protected from unauthorized access.",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.6,
        ),
      ),

      SizedBox(height: 24),
              const Divider(),

              SizedBox(height: 20),

              Text(
                "Payments",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D4C41),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "All payments are processed through secure payment partners. Stitch Swift does not store your debit or credit card details.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),

              SizedBox(height: 24),

              Divider(),

              SizedBox(height: 20),

              Text(
                "Third-Party Services",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D4C41),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Our app may use trusted third-party services such as Firebase, Google Services and Razorpay to improve security and provide a better experience.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),

              SizedBox(height: 24),

              Divider(),

              SizedBox(height: 20),

              Text(
                "Seller Responsibilities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D4C41),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "• Provide correct shop information.\n"
                    "• Upload genuine products only.\n"
                    "• Follow platform policies.\n"
                    "• Respect customer rights.\n"
                    "• Do not upload prohibited items.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),

              SizedBox(height: 24),

              Divider(),

              SizedBox(height: 20),

              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D4C41),
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: const [
                  Icon(Icons.email,
                      color: Color(0xff6D4C41), size: 20),
                  SizedBox(width: 10),
                  Text("support@stitchswift.com"),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: const [
                  Icon(Icons.phone,
                      color: Color(0xff6D4C41), size: 20),
                  SizedBox(width: 10),
                  Text("+91 98765 43210"),
                ],
              ),

              SizedBox(height: 24),

              Divider(),

              SizedBox(height: 20),

              Center(
                child: Column(
                  children: const [

                    Text(
                      "Last Updated",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6D4C41),
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "July 2026",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Stitch Swift Seller\nVersion 1.0.0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                  ],
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