import 'package:flutter/material.dart';
import 'T shirts page.dart';
import 'Mens page.dart';
import 'Women Page.dart';
import 'Trending page.dart';
import 'Address.dart';
import 'Mangalik Fashion Shop.dart';


void main() {
  runApp(LocalFashion());
}

class LocalFashion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fast Fashion Hub",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff8f8f8),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  // SHOP DATA
  final List<Map<String, String>> shops = [
    {
      "name": "Mangalik Fashion ",
      "time": "15 mins",
      "rating": "4.8",
      "offer": "30% OFF",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj5Hr6lWHe39hPvwjNOBi9TOz-lo9ggk1OKw&s"
    },
    {
      "name": "Lok Rang Fashion",
      "time": "50 mins",
      "rating": "4.7",
      "offer": "Buy 1 Get 1 Free",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW8R2LZ6SkGrsvrT7TFJswdzGm8LDRqrRNCg&s"
    },
    {
      "name": "V Mart Fashion",
      "time": "45 mins",
      "rating": "4.9",
      "offer": "Flat ₹200 OFF",
      "image":
      "https://threebestrated.in/images/VMartBhopal-Bhopal-MP.jpeg"
    },
  ];

  // CATEGORY DATA (UPDATED)
  final List<Map<String, dynamic>> category = [
    {"icon": Icons.checkroom, "name": "T-Shirts"},
    {"icon": Icons.man, "name": "Men Wear"},
    {"icon": Icons.woman, "name": "Women Wear"},
    {"icon": Icons.trending_up, "name": "Trending"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: [

            // ================= HEADER =================
            Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff111111), Color(0xff2d2d2d)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [

                // LOCATION + PROFILE
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.orange),
                    SizedBox(width: 6),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressPage(),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bhopal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Delivering from Local Shops",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                // SEARCH BAR
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search shirts, jeans, shoes...",
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.orange),
                    ],
                  ),
                ),

                SizedBox(height: 18),

                // BANNER
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/900/400"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black45,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Same Day Delivery",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Fashion from nearby local stores",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // CATEGORY TITLE
          sectionTitle("Shop by Category"),

          SizedBox(height: 12),

          // CATEGORY LIST
          SizedBox(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: GestureDetector(
                    onTap: () {
                      if (category[index]["name"] == "T-Shirts") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TShirtPage(),
                          ),
                        );
                      }
                      if (category[index]["name"] == "Men Wear") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MensPage(),
                          ),
                        );
                      }
                      if (category[index]["name"] == "Women Wear") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WomenPage(),
                          ),
                        );
                      }
                      if (category[index]["name"] == "Trending") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TrendingPage(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            category[index]["icon"],
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          category[index]["name"],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),

          // SHOP TITLE
          sectionTitle("Top Nearby Shops"),

          SizedBox(height: 12),
                  // SHOP CARDS
                  ListView.builder(
                    itemCount: shops.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Column(
                          children: [

                            // IMAGE
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(22),
                              ),
                              child: Image.network(
                                shops[index]["image"]!,
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 170,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // DETAILS
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                children: [

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          shops[index]["name"]!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          shops[index]["rating"]!,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          size: 18, color: Colors.grey),
                                      SizedBox(width: 5),
                                      Text(shops[index]["time"]!),

                                      SizedBox(width: 15),

                                      Icon(Icons.local_offer,
                                          size: 18, color: Colors.orange),
                                      SizedBox(width: 5),
                                      Text(
                                        shops[index]["offer"]!,
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 14),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        padding: EdgeInsets.all(14),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const MangalikFashionPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Shop Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 100),
          ],
        ),
    ),
    ),


      // ================= BOTTOM NAV =================
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(14),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, "Home", true),
            navItem(Icons.favorite, "Wishlist", false),
            navItem(Icons.receipt_long, "Orders", false),
            navItem(Icons.person, "Profile", false),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            "See All",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // NAV ITEM
  Widget navItem(IconData icon, String title, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? Colors.orange : Colors.grey,
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.orange : Colors.grey,
          ),
        )
      ],
    );
  }
}

// ================= PROFILE PAGE (UPDATED) =================
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 25),

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12),

            Text(
              "Anish Mishra",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "anish@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 25),

            // ✅ UPDATED OPTIONS (ONLY 5)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.orange),
                title: Text("My Orders"),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyOrdersPage(),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.orange),
                title: Text("Wishlist"),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishlistPage(),
                    ),
                  );
                },
              ),
            ),
            profileTile(Icons.local_offer, "Offers & Coupons"),
            profileTile(Icons.settings, "Settings"),
            profileTile(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget profileTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {},
      ),
    );
  }
}
class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("My Orders"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 90,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              "No Orders Yet",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You haven't placed any orders yet.\nStart shopping now!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                );
              },
              child: Text("Start Shopping"),
            ),
          ],
        ),
      ),
    );
  }
}
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Wishlist"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.favorite_border,
              size: 90,
              color: Colors.grey,
            ),

            SizedBox(height: 15),

            Text(
              "Your Wishlist is Empty",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Save your favorite fashion items here ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),

              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                );
              },

              child: Text("Start Exploring"),
            ),
          ],
        ),
      ),
    );
  }
}