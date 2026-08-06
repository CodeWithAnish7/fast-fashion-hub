import 'package:flutter/material.dart';
import 'Seller_CREAYE_ACCOUNT_page.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({super.key});

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F4F1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xff6B4A3A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.storefront,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Seller Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Login to manage your shop and receive orders.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Mobile Number",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: "Enter Mobile Number",
                  filled: true,
                  fillColor: Colors.white,
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // OTP Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6B4A3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New Seller? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SellerCreateAccountScreen (),
                        ),
                      );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Color(0xff6B4A3A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}