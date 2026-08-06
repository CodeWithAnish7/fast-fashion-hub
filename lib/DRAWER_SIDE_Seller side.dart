import 'package:flutter/material.dart';
import 'package:sage/Seller_LOGIN_page.dart';
import 'Help and Support in Seller side.dart';
import 'PRIVACY_POLiCY_SEller side.dart';
import 'ABOUT_SELLER SIDE.dart';
import 'Seller_CREAYE_ACCOUNT_page.dart';

class SellerDrawer extends StatelessWidget {
  const SellerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xffF8F4EE),

        child: SafeArea(
          child: Column(
            children: [

            // ================= HEADER =================

            Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(
              color: Color(0xff6D4C41),
            ),

            child: Column(

              children: [

                Stack(

                  children: [

                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage(
                        "https://content.jdmagicbox.com/v2/comp/bhopal/s3/0755px755.x755.140624143057.z3s3/catalogue/manglik-lakherapura-bhopal-readymade-garment-retailers-wzzp0y816e-250.jpg?type=360",
                      ),

                      // Backend ke baad
                      // backgroundImage:
                      // NetworkImage(shopImageUrl),
                    ),

                    Positioned(

                      right: 0,
                      bottom: 0,

                      child: Container(

                        padding: const EdgeInsets.all(5),

                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 18,
                        ),

                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 14),

                const Text(

                  "Mangalik Fashion",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 4),

                const Text(

                  "Owner : Anish Mishra",

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),

                ),

                const SizedBox(height: 10),

                Container(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(20),

                  ),

                  child: const Row(

                    mainAxisSize: MainAxisSize.min,

                    children: [

                      Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 18,
                      ),

                      SizedBox(width: 6),

                      Text(

                        "Verified Seller",

                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),

                      ),

                    ],

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                _drawerItem(
                  icon: Icons.language,
                  title: "Language",
                  onTap: () {

                  },
                ),

                _drawerItem(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpSupportPage(),
                      ),
                    );
                  },
                ),
                _drawerItem(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy",
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage(),
                      ),
                    );
                  },
                ),

                _drawerItem(
                  icon: Icons.info_outline,
                  title: "About App",
                  onTap: () {

                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutAppPage(),
                      ),
                    );

                  },
                ),

                const Divider(
                  height: 30,
                  thickness: 1,
                ),

                _drawerItem(
                  icon: Icons.logout,
                  title: "Logout",
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {

                    showDialog(

                      context: context,

                      builder: (context) {

                        return AlertDialog(

                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(18),
                          ),

                          title: const Text(
                            "Logout",
                          ),

                          content: const Text(
                            "Are you sure you want to logout?",
                          ),

                          actions: [

                            TextButton(
                              onPressed: () {

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SellerLoginScreen(),
                                  ),
                                      (route) => false,
                                );

                              },

                              child: const Text(
                                "Logout",
                              ),

                            ),

                          ],

                        );

                      },

                    );

                  },
                ),

              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 18),
            child: Text(
              "Stitch Swift Seller v1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
            ],
          ),
        ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = const Color(0xff6D4C41),
    Color textColor = const Color(0xff6D4C41),
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),

      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),

      onTap: onTap,
    );
  }
}