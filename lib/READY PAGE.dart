import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MAIN HOMEPAGE.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF5C4033),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const StitchAp());
}

class StitchAp extends StatelessWidget {
  const StitchAp({super.key});

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
                      text: " Swift",
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
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController =
  TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C4033),
        title: const Text(""),
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
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,

                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    prefixIcon: const Icon(Icons.phone),
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
                    onPressed: () {
                      if (phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please enter mobile number",
                            ),
                          ),
                        );
                        return;
                      }

                      if (phoneController.text.length != 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please enter valid 10 digit number",
                            ),
                          ),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpPage(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF795548),
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
                      color: Colors.black,
                      fontSize: 18,
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

class MySignup extends StatefulWidget {
  const MySignup({super.key});

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void validateAndContinue() {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter name")),
      );
      return;
    }

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter phone number")),
      );
      return;
    }

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid 10 digit number")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Enter full number")),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C4033),
        title: const Text(""),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5C4033), Colors.brown],
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
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // NAME
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Full Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // EMAIL (OPTIONAL)
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email (Optional)",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // PHONE
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefixIcon: const Icon(Icons.phone),
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
                    onPressed: validateAndContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF795548),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ================= OTP PAGE =================

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C4033),
        title: const Text(""),
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
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enter the 6-digit OTP sent to your phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    hintText: "------",
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF795548),
                    ),

                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
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