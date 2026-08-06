import 'package:flutter/material.dart';

class ManageProductsPage extends StatefulWidget {
  const ManageProductsPage({super.key});

  @override
  State<ManageProductsPage> createState() => ManageProductsPageState();
}

class ManageProductsPageState extends State<ManageProductsPage> {
  final TextEditingController _searchController = TextEditingController();

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Out of Stock",
  ];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Premium Shirt",
      "category": "Men",
      "price": 999,
      "stock": 25,
      "image":
      "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500",
    },
    {
      "name": "Designer Kurti",
      "category": "Women",
      "price": 1499,
      "stock": 12,
      "image":
      "https://images.unsplash.com/photo-1585487000160-6ebcfceb0d03?w=500",
    },
    {
      "name": "Kids Hoodie",
      "category": "Kids",
      "price": 799,
      "stock": 0,
      "image":
      "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500",
    },
  ];

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
          "Manage Products",
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

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0,4),
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
                  hintText: "Search Products",
                  contentPadding:
                  EdgeInsets.symmetric(vertical:18),
                ),
              ),
            ),

            const SizedBox(height:18),

            SizedBox(
              height:42,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: filters.length,

                itemBuilder:(context,index){

                  bool selected=
                      selectedFilter==filters[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(right:10),

                    child: GestureDetector(

                      onTap:(){

                        setState(() {
                          selectedFilter=
                          filters[index];
                        });

                      },

                      child: Container(

                        padding:
                        const EdgeInsets.symmetric(
                          horizontal:18,
                        ),

                        decoration: BoxDecoration(

                          color:selected
                              ?const Color(0xff6D4C41)
                              :Colors.white,

                          borderRadius:
                          BorderRadius.circular(20),

                          boxShadow:const[
                            BoxShadow(
                              color:Colors.black12,
                              blurRadius:8,
                            ),
                          ],

                        ),

                        alignment:Alignment.center,

                        child: Text(

                          filters[index],

                          style:TextStyle(

                            color:selected
                                ?Colors.white
                                :const Color(0xff6D4C41),

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

            const SizedBox(height:20),

            Expanded(

              child: ListView(

                children:[
                  ...products.where((product) {

                    final search = _searchController.text
                        .toLowerCase();

                    final matchSearch =
                    product["name"]
                        .toString()
                        .toLowerCase()
                        .contains(search);

                    bool matchFilter = true;

                    if (selectedFilter == "Men") {
                      matchFilter =
                          product["category"] == "Men";
                    } else if (selectedFilter == "Women") {
                      matchFilter =
                          product["category"] == "Women";
                    } else if (selectedFilter == "Kids") {
                      matchFilter =
                          product["category"] == "Kids";
                    } else if (selectedFilter ==
                        "Out of Stock") {
                      matchFilter =
                          product["stock"] == 0;
                    }

                    return matchSearch && matchFilter;

                  }).map((product) {

                    return Container(

                      margin: const EdgeInsets.only(
                        bottom: 18,
                      ),

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

                      child: Padding(

                        padding:
                        const EdgeInsets.all(14),

                        child: Column(

                          children: [

                            Row(

                              children: [

                                ClipRRect(

                                  borderRadius:
                                  BorderRadius.circular(
                                      14),

                                  child: Image.network(

                                    product["image"],

                                    width: 95,

                                    height: 95,

                                    fit: BoxFit.cover,

                                  ),

                                ),

                                const SizedBox(width: 14),

                                Expanded(

                                  child: Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                    children: [

                                      Text(

                                        product["name"],

                                        style:
                                        const TextStyle(

                                          fontSize: 18,

                                          fontWeight:
                                          FontWeight.bold,

                                        ),

                                      ),

                                      const SizedBox(
                                          height: 6),

                                      Text(

                                        product["category"],

                                        style:
                                        const TextStyle(

                                          color: Colors.grey,

                                          fontSize: 14,

                                        ),

                                      ),

                                      const SizedBox(
                                          height: 8),

                                      Text(

                                        "₹${product["price"]}",

                                        style:
                                        const TextStyle(

                                          color: Color(
                                              0xff6D4C41),

                                          fontSize: 20,

                                          fontWeight:
                                          FontWeight.bold,

                                        ),

                                      ),

                                      const SizedBox(
                                          height: 10),

                                      Container(

                                        padding:
                                        const EdgeInsets
                                            .symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),

                                        decoration:
                                        BoxDecoration(

                                          color: product[
                                          "stock"] ==
                                              0
                                              ? Colors.red
                                              .shade50
                                              : Colors.green
                                              .shade50,

                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              20),

                                        ),

                                        child: Text(

                                          product["stock"] ==
                                              0
                                              ? "Out of Stock"
                                              : "Stock : ${product["stock"]}",

                                          style: TextStyle(

                                            color: product[
                                            "stock"] ==
                                                0
                                                ? Colors.red
                                                : Colors.green,

                                            fontWeight:
                                            FontWeight
                                                .w600,

                                          ),

                                        ),

                                      ),
                                      const SizedBox(height: 16),

                                      Row(
                                        children: [

                                          Expanded(
                                            child: ElevatedButton.icon(
                                              onPressed: () {

                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                              label: const Text("Edit"),
                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                const Color(0xff6D4C41),
                                                foregroundColor:
                                                Colors.white,
                                                elevation: 0,
                                                minimumSize:
                                                const Size(0, 46),
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      14),
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 12),

                                          Expanded(
                                            child: OutlinedButton.icon(
                                              onPressed: () {

                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                      ),
                                                      title: const Text(
                                                          "Delete Product"),
                                                      content: const Text(
                                                          "Are you sure you want to delete this product?"),
                                                      actions: [

                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Cancel"),
                                                        ),

                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style:
                                                          ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.red,
                                                          ),
                                                          child: const Text(
                                                              "Delete"),
                                                        ),

                                                      ],
                                                    );
                                                  },
                                                );

                                              },
                                              icon: const Icon(
                                                Icons.delete_outline,
                                                size: 18,
                                              ),
                                              label:
                                              const Text("Delete"),
                                              style:
                                              OutlinedButton.styleFrom(
                                                foregroundColor:
                                                Colors.red,
                                                side: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                                minimumSize:
                                                const Size(0, 46),
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      14),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

}