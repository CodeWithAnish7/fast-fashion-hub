import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> {
  final TextEditingController _searchController =
  TextEditingController();

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Pending",
    "Shipped",
    "Delivered",
    "Cancelled",
  ];

  final List<Map<String, dynamic>> orders = [
    {
      "customer": "Rahul Sharma",
      "product": "Premium Shirt",
      "price": 999,
      "status": "Pending",
      "date": "10 Jul 2026",
      "image":
      "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500",
    },
    {
      "customer": "Aman Verma",
      "product": "Designer Kurti",
      "price": 1499,
      "status": "Shipped",
      "date": "09 Jul 2026",
      "image":
      "https://images.unsplash.com/photo-1585487000160-6ebcfceb0d03?w=500",
    },
    {
      "customer": "Priya Singh",
      "product": "Kids Hoodie",
      "price": 799,
      "status": "Delivered",
      "date": "08 Jul 2026",
      "image":
      "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F4EE),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8F4EE),
        elevation: 0,
        centerTitle: true,
        iconTheme:
        const IconThemeData(color: Color(0xff6D4C41)),
        title: const Text(
          "Orders",
          style: TextStyle(
            color: Color(0xff6D4C41),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

        Row(
        children: [

        Expanded(
        child: _summaryCard(
          "25",
          "Total",
          Icons.shopping_bag_outlined,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: _summaryCard(
          "6",
          "Pending",
          Icons.pending_actions,
        ),
      ),

      ],
    ),

    const SizedBox(height: 12),

    Row(
    children: [

    Expanded(
    child: _summaryCard(
    "12",
    "Delivered",
    Icons.check_circle_outline,
    ),
    ),

    const SizedBox(width: 12),

    Expanded(
    child: _summaryCard(
    "7",
    "Shipped",
    Icons.local_shipping_outlined,
    ),
    ),

    ],
    ),

    const SizedBox(height: 20),

    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius:
    BorderRadius.circular(18),
    boxShadow: const [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    ),
    ],
    ),

    child: TextField(
    controller: _searchController,

    decoration: const InputDecoration(
    border: InputBorder.none,
    prefixIcon: Icon(
    Icons.search,
    color: Color(0xff6D4C41),
    ),
    hintText: "Search Orders",
    contentPadding:
    EdgeInsets.symmetric(
    vertical: 18,
    ),
    ),
    ),
    ),

    const SizedBox(height: 18),

    SizedBox(
    height: 42,

    child: ListView.builder(
    scrollDirection: Axis.horizontal,

    itemCount: filters.length,

    itemBuilder: (context, index) {

    bool selected =
    selectedFilter ==
    filters[index];

    return Padding(
    padding:
    const EdgeInsets.only(
    right: 10,
    ),

    child: GestureDetector(

    onTap: () {

    setState(() {
    selectedFilter =
    filters[index];
    });

    },

    child: Container(

    padding:
    const EdgeInsets
        .symmetric(
    horizontal: 18,
    ),

    decoration:
    BoxDecoration(

    color: selected
    ? const Color(
    0xff6D4C41)
        : Colors.white,

    borderRadius:
    BorderRadius
        .circular(20),

    ),

    alignment:
    Alignment.center,

    child: Text(

    filters[index],

    style: TextStyle(
    color: selected
    ? Colors.white
        : const Color(
    0xff6D4C41),
    fontWeight:
    FontWeight.w600,
    ),

    ),

    ),

    ),

    );

    },

    ),

    ),

    const SizedBox(height: 18),

    Expanded(

    child: ListView(

    children: [
    ...orders.where((order) {
    final search = _searchController.text
        .toLowerCase();

    final matchSearch =
    order["customer"]
        .toString()
        .toLowerCase()
        .contains(search) ||
    order["product"]
        .toString()
        .toLowerCase()
        .contains(search);

    bool matchFilter = true;

    if (selectedFilter != "All") {
    matchFilter =
    order["status"] == selectedFilter;
    }

    return matchSearch && matchFilter;

    }).map((order) {

    Color statusColor;

    switch (order["status"]) {
    case "Pending":
    statusColor = Colors.orange;
    break;
    case "Shipped":
    statusColor = Colors.blue;
    break;
    case "Delivered":
    statusColor = Colors.green;
    break;
    default:
    statusColor = Colors.red;
    }

    return Container(

    margin: const EdgeInsets.only(bottom: 18),

    padding: const EdgeInsets.all(14),

    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius:
    BorderRadius.circular(18),
    boxShadow: const [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    offset: Offset(0, 4),
    ),
    ],
    ),

    child: Column(

    children: [

    Row(

    children: [

    ClipRRect(
    borderRadius:
    BorderRadius.circular(14),
    child: Image.network(
    order["image"],
    width: 80,
    height: 80,
    fit: BoxFit.cover,
    ),
    ),

    const SizedBox(width: 14),

    Expanded(

    child: Column(

    crossAxisAlignment:
    CrossAxisAlignment.start,

    children: [

    Text(
    order["product"],
    style:
    const TextStyle(
    fontSize: 17,
    fontWeight:
    FontWeight.bold,
    ),
    ),

    const SizedBox(height: 6),

    Text(
    "Customer : ${order["customer"]}",
    style:
    const TextStyle(
    color: Colors.grey,
    ),
    ),

    const SizedBox(height: 6),

    Text(
    "Date : ${order["date"]}",
    style:
    const TextStyle(
    color: Colors.grey,
    ),
    ),

    const SizedBox(height: 10),

    Text(
    "₹${order["price"]}",
    style:
    const TextStyle(
    color:
    Color(0xff6D4C41),
    fontWeight:
    FontWeight.bold,
    fontSize: 20,
    ),
    ),

    ],

    ),

    ),

    Container(

    padding:
    const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
    ),

    decoration: BoxDecoration(
    color:
    statusColor.withOpacity(.12),
    borderRadius:
    BorderRadius.circular(20),
    ),

    child: Text(

    order["status"],

    style: TextStyle(
    color: statusColor,
    fontWeight:
    FontWeight.bold,
    ),

    ),

    ),

    ],

    ),

    const SizedBox(height: 16),

    Row(
    children: [
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.visibility_outlined,
            size: 18,
          ),
          label: const Text("View"),
          style: ElevatedButton.styleFrom(
            backgroundColor:
            const Color(0xff6D4C41),
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize:
            const Size(double.infinity, 46),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(14),
            ),
          ),
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.local_shipping_outlined,
            size: 18,
          ),
          label: const Text("Update"),
          style: OutlinedButton.styleFrom(
            foregroundColor:
            const Color(0xff6D4C41),
            side: const BorderSide(
              color: Color(0xff6D4C41),
            ),
            minimumSize:
            const Size(double.infinity, 46),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(14),
            ),
          ),
        ),
      ),

    ],
    ),

    ],
    ),
    );

    }).toList(),

    ],
    ),
    ),

          ],
        ),
      ),
    );
  }

  Widget _summaryCard(
      String value,
      String title,
      IconData icon,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xff6D4C41),
            size: 28,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff6D4C41),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}