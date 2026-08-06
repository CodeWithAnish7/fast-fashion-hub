import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  final TextEditingController _searchController = TextEditingController();

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Today",
    "This Week",
  ];

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "New Order Received",
      "subtitle": "Order #1024 has been placed.",
      "time": "2 min ago",
      "type": "Today",
      "icon": Icons.shopping_bag,
      "color": Colors.green,
      "read": false,
    },
    {
      "title": "Payment Received",
      "subtitle": "₹1,299 credited successfully.",
      "time": "15 min ago",
      "type": "Today",
      "icon": Icons.account_balance_wallet,
      "color": Colors.blue,
      "read": false,
    },
    {
      "title": "Low Stock Alert",
      "subtitle": "Black Hoodie has only 2 items left.",
      "time": "1 hour ago",
      "type": "Today",
      "icon": Icons.warning_amber,
      "color": Colors.orange,
      "read": true,
    },
    {
      "title": "Offer Expiring Soon",
      "subtitle": "SUMMER20 expires tomorrow.",
      "time": "Yesterday",
      "type": "This Week",
      "icon": Icons.local_offer,
      "color": Colors.deepPurple,
      "read": true,
    },
    {
      "title": "Order Cancelled",
      "subtitle": "Order #1018 cancelled by customer.",
      "time": "2 days ago",
      "type": "This Week",
      "icon": Icons.cancel,
      "color": Colors.red,
      "read": true,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          "Notifications",
          style: TextStyle(
            color: Color(0xff6D4C41),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var item in notifications) {
                  item["read"] = true;
                }
              });
            },
            child: const Text(
              "Mark All",
              style: TextStyle(
                color: Color(0xff6D4C41),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
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
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff6D4C41),
                  ),
                  hintText: "Search Notifications",
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Filter chips
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final bool selected = selectedFilter == filters[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xff6D4C41)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : const Color(0xff6D4C41),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 18),

            // Notification list
            Expanded(
              child: ListView(
                children: notifications.where((item) {
                  final search = _searchController.text.toLowerCase();

                  final matchSearch = item["title"]
                      .toString()
                      .toLowerCase()
                      .contains(search) ||
                      item["subtitle"]
                          .toString()
                          .toLowerCase()
                          .contains(search);

                  bool matchFilter = true;
                  if (selectedFilter != "All") {
                    matchFilter = item["type"] == selectedFilter;
                  }

                  return matchSearch && matchFilter;
                }).map((item) {
                  final bool isRead = item["read"] as bool;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color:
                            (item["color"] as Color).withOpacity(.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            item["icon"] as IconData,
                            color: item["color"] as Color,
                            size: 26,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item["title"] as String,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  if (!isRead)
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Text(
                                item["subtitle"] as String,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Color(0xff6D4C41),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    item["time"] as String,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == "read") {
                              setState(() {
                                item["read"] = true;
                              });
                            } else if (value == "delete") {
                              setState(() {
                                notifications.remove(item);
                              });
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: "read",
                              child: Text("Mark as Read"),
                            ),
                            PopupMenuItem(
                              value: "delete",
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
