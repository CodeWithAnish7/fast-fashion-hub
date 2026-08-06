import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF5C4033),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const StitchApp());
}

class StitchApp extends StatelessWidget {
  const StitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoleSelectionScreen(),
    );
  }
}

// ================= HOME PAGE =================

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C4033),

      body: SafeArea(
        child: Container(
          width: double.infinity,

          child: Column(
            children: [

              const SizedBox(height: 40),

              // LOGO
              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: const Color(0xFF5C4033),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Icon(
                  Icons.checkroom,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 20),

              // APP NAME
              RichText(
                text: const TextSpan(
                  children: [

                    TextSpan(
                      text: "Stitch",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    TextSpan(
                      text: "Swift",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Same-Day Cloth Delivery · Order by 10AM, Get by 6PM",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Row(
                  children: [

                    // SHOPPER CARD
                    Expanded(
                      child: RoleCard(

                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );

                        },

                        icon: Icons.shopping_bag,
                        title: "I'm a Shopper",
                        subtitle:
                        "Browse & order clothes with same-day delivery",
                        color1: Colors.black,
                        color2: Colors.black26,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // SELLER CARD
                    Expanded(
                      child: RoleCard(

                        onTap: () {},

                        icon: Icons.store,
                        title: "I'm a Seller",
                        subtitle:
                        "Manage your store, orders & inventory",
                        color1: Colors.black26,
                        color2: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ROLE CARD =================

class RoleCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color1,
    required this.color2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(
        height: 255,
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),

                borderRadius: BorderRadius.circular(20),
              ),

              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= LOGIN PAGE =================

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFF5C4033),
        title: const Text("Login"),
      ),

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5C4033),
              Colors.brown,
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                const Text(
                  "Log in",

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF795548),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      "Login",

                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(

                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MySignup(),
                      ),
                    );

                  },

                  child: const Text(
                    "Sign Up",

                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= SIGNUP PAGE =================

class MySignup extends StatelessWidget {
  const MySignup({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFF5C4033),
        title: const Text("Signup"),
      ),

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5C4033),
              Colors.brown,
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                const Text(
                  "Welcome",

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: const Icon(Icons.person),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF795548),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      "Sign Up",

                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}