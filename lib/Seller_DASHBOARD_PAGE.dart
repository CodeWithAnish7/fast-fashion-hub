import 'package:flutter/material.dart';
import 'package:sage/Notification%20in%20seller%20side.dart';
import 'package:sage/Offers%20and%20coupon%20in%20seller.dart';
import 'add.product_page.dart';
import 'ManageProduct.dart';
import 'Order_Page_Sellerpage.dart';
import 'Shop profile Seller side.dart';
import 'DRAWER_SIDE_Seller side.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stitch Swift - Seller Panel',
      theme: ThemeData(
        fontFamily: 'Poppins', // add Poppins in pubspec.yaml if you want exact font
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const SellerDashboardScreen(),
    );
  }
}

// ---------------- Color Palette ----------------
class AppColors {
  static const background = Color(0xFFF8F3EC);
  static const cardBg = Color(0xFFFFFFFF);
  static const brownDark = Color(0xFF4A2E20);
  static const brownMed = Color(0xFF6B4630);
  static const orangeSoft = Color(0xFFF4A94D);
  static const orangeBg = Color(0xFFFCEBD8);
  static const greenBg = Color(0xFFDFF3E3);
  static const green = Color(0xFF3CAE58);
  static const purpleBg = Color(0xFFEAE3F8);
  static const purple = Color(0xFF8A6FD1);
  static const blueBg = Color(0xFFDCEBFB);
  static const blue = Color(0xFF3E86E0);
  static const grayText = Color(0xFF8C8580);
  static const bannerBg = Color(0xFFF3E9DE);
}

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const SellerDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildTopBar(context),
              const SizedBox(height: 20),
              _buildWelcomeSection(),
              const SizedBox(height: 16),
              _buildShopBanner(),
              const SizedBox(height: 24),
              _buildSectionHeader('Today\'s Summary'),
              const SizedBox(height: 12),
              _buildSummaryGrid(),
              const SizedBox(height: 24),
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.brownDark,
                ),
              ),
              const SizedBox(height: 14),
              _buildQuickActions(context),
              const SizedBox(height: 24),
              _buildSectionHeader('Recent Orders'),
              const SizedBox(height: 12),
              _buildOrderTile(
                imageUrl: 'https://picsum.photos/seed/order1/100/100', // TODO: replace with product photo URL
                name: 'Rahul Verma',
                subtitle: 'Black Oversized T-Shirt',
                date: '16 May, 10:30 AM',
                price: '₹1,299',
                status: 'New',
                statusColor: AppColors.orangeSoft,
                statusBg: AppColors.orangeBg,
              ),
              _buildOrderTile(
                imageUrl: 'https://picsum.photos/seed/order2/100/100', // TODO: replace with product photo URL
                name: 'Neha Singh',
                subtitle: 'White Cotton Shirt',
                date: '16 May, 09:15 AM',
                price: '₹899',
                status: 'Accepted',
                statusColor: AppColors.blue,
                statusBg: AppColors.blueBg,
              ),
              _buildOrderTile(
                imageUrl: 'https://picsum.photos/seed/order3/100/100', // TODO: replace with product photo URL
                name: 'Amit Patel',
                subtitle: 'Blue Denim Jeans',
                date: '15 May, 08:45 PM',
                price: '₹1,599',
                status: 'Ready',
                statusColor: AppColors.purple,
                statusBg: AppColors.purpleBg,
              ),
              const SizedBox(height: 20), // space for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Top Bar ----------------
  Widget _buildTopBar( BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: AppColors.brownDark,
                size: 26,
              ),
            );
          },
        ),
        Column(
          children: [
            const Text(
              'Stitch Swift',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.brownDark,
              ),
            ),
            Text(
              'Seller Panel',
              style: TextStyle(fontSize: 12, color: AppColors.grayText),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_none,
                color: AppColors.brownDark,
                size: 26,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ---------------- Welcome ----------------
  Widget _buildWelcomeSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: TextStyle(fontSize: 14, color: AppColors.grayText)),
              const SizedBox(height: 2),
              const Text(
                'Mangalik Fashion 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownDark,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.orangeBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.verified, size: 14, color: AppColors.orangeSoft),
                    SizedBox(width: 4),
                    Text(
                      'Verified Seller',
                      style: TextStyle(fontSize: 12, color: AppColors.brownMed, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // small shop image placeholder next to the greeting
        Container(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            color: const Color(0xFFEDE6DC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.brownMed.withOpacity(0.2)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://content.jdmagicbox.com/v2/comp/bhopal/s3/0755px755.x755.140624143057.z3s3/catalogue/manglik-lakherapura-bhopal-readymade-garment-retailers-wzzp0y816e-250.jpg?type=360",
              width: 78,
              height: 78,
              fit: BoxFit.cover,
            ),
          ),
          // TODO: replace this Container with:
          // Image.network('YOUR_SHOP_PHOTO_URL', fit: BoxFit.cover)
          // (wrap in ClipRRect with borderRadius: 16 as before)
        ),
      ],
    );
  }

  // ---------------- Shop Banner ----------------
  Widget _buildShopBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bannerBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE6DC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.brownMed.withOpacity(0.2)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://content.jdmagicbox.com/comp/bhopal/s3/0755px755.x755.140624143057.z3s3/catalogue/manglik-lakherapura-bhopal-gents-readymade-garment-retailers-lwqtr.jpg",
                width: 78,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
            // TODO: replace this Container with:
            // Image.network('YOUR_SHOP_PHOTO_URL', fit: BoxFit.cover)
            // (wrap in ClipRRect/borderRadius as before)
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Mangalik Fashion',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.brownDark),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.edit, size: 14, color: AppColors.grayText),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 13, color: AppColors.green),
                    Text(' Bhopal, Madhya Pradesh',
                        style: TextStyle(fontSize: 12, color: AppColors.grayText)),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  'Open • Closes at 10:00 PM',
                  style: TextStyle(fontSize: 12, color: AppColors.green, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // small compact View Shop button (in place of the removed right image)
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brownDark,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'View Shop',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Section header helper ----------------
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.brownDark),
        ),
        Text('View All', style: TextStyle(fontSize: 13, color: AppColors.grayText)),
      ],
    );
  }

  // ---------------- Summary Grid ----------------
  Widget _buildSummaryGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _summaryCard(
                icon: Icons.shopping_bag_outlined,
                iconBg: AppColors.orangeBg,
                iconColor: AppColors.orangeSoft,
                label: 'Total Orders',
                value: '128',
                delta: '+12 today',
                deltaColor: AppColors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _summaryCard(
                icon: Icons.access_time,
                iconBg: AppColors.orangeBg,
                iconColor: AppColors.orangeSoft,
                label: 'Pending Orders',
                value: '18',
                delta: '+4 new',
                deltaColor: AppColors.orangeSoft,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _summaryCard(
                icon: Icons.check_circle_outline,
                iconBg: AppColors.greenBg,
                iconColor: AppColors.green,
                label: 'Delivered Orders',
                value: '98',
                delta: '+10 today',
                deltaColor: AppColors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _summaryCard(
                icon: Icons.currency_rupee,
                iconBg: AppColors.purpleBg,
                iconColor: AppColors.purple,
                label: 'Total Revenue',
                value: '₹45,680',
                delta: '+18% this week',
                deltaColor: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _summaryCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String value,
    required String delta,
    required Color deltaColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(height: 10),
          Text(value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.brownDark)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: AppColors.grayText)),
          const SizedBox(height: 4),
          Text(delta, style: TextStyle(fontSize: 11, color: deltaColor, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // ---------------- Quick Actions ----------------
  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.add, 'label': 'Add Product'},
      {'icon': Icons.inventory_2_outlined, 'label': 'Manage\nProducts'},
      {'icon': Icons.receipt_long_outlined, 'label': 'Orders'},
      {'icon': Icons.local_offer_outlined, 'label': 'Offers &\nCoupons'},
      {'icon': Icons.storefront_outlined, 'label': 'Shop\nProfile'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((a) {
        return GestureDetector(
          onTap: () {
            if (a['label'] == 'Add Product') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductPage(),
                ),
              );
            } else if (a['label'] == 'Manage\nProducts') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageProductsPage(),
                ),
              );
            } else if (a['label'] == 'Orders') {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrdersPage(),
                ),
              );

            }  else if (a['label'] == 'Offers &\nCoupons') {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersPage(),
                ),
              );

            } else if (a['label'] == 'Shop\nProfile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopProfilePage(),
                ),
              );
            }
          },
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: AppColors.brownMed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  a['icon'] as IconData,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 62,
                child: Text(
                  a['label'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.brownDark,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ---------------- Order Tile ----------------
  Widget _buildOrderTile({
    required String imageUrl,
    required String name,
    required String subtitle,
    required String date,
    required String price,
    required String status,
    required Color statusColor,
    required Color statusBg,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 46,
              height: 46,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.brownDark)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: AppColors.grayText)),
                Text(date, style: TextStyle(fontSize: 11, color: AppColors.grayText)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.brownDark)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(20)),
                child: Text(status, style: TextStyle(fontSize: 10, color: statusColor, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



