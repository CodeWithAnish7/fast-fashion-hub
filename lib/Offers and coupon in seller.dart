import 'package:flutter/material.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {

  final TextEditingController _searchController =
  TextEditingController();

  final TextEditingController _offerNameController =
  TextEditingController();

  final TextEditingController _couponController =
  TextEditingController();

  final TextEditingController _discountController =
  TextEditingController();

  final TextEditingController _validityController =
  TextEditingController();

  String selectedFilter = "All";

  int editingIndex = -1;

  final List<String> filters = [
    "All",
    "Active",
    "Expired",
  ];

  List<Map<String, dynamic>> offers = [
    {
      "title": "Summer Sale",
      "coupon": "SUMMER20",
      "discount": "20%",
      "status": "Active",
      "valid": "31 Jul 2026",
    },
    {
      "title": "New User Offer",
      "coupon": "WELCOME10",
      "discount": "10%",
      "status": "Active",
      "valid": "20 Jul 2026",
    },
    {
      "title": "Festive Sale",
      "coupon": "FEST50",
      "discount": "50%",
      "status": "Expired",
      "valid": "30 Jun 2026",
    },
  ];

  int get totalOffers => offers.length;

  int get activeOffers =>
      offers.where((e) => e["status"] == "Active").length;

  int get expiredOffers =>
      offers.where((e) => e["status"] == "Expired").length;

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
          "Offers & Coupons",
          style: TextStyle(
            color: Color(0xff6D4C41),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6D4C41),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          editingIndex = -1;

          _offerNameController.clear();
          _couponController.clear();
          _discountController.clear();
          _validityController.clear();

          _showOfferSheet();
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
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

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            _topCard(
              totalOffers.toString(),
              "Total",
              const Color(0xff6D4C41),
            ),

            _topCard(
              activeOffers.toString(),
              "Active",
              Colors.green,
            ),

            _topCard(
              expiredOffers.toString(),
              "Expired",
              Colors.red,
            ),

          ],
        ),
      ),

      const SizedBox(height: 20),
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
              hintText: "Search Offers...",
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
                  selectedFilter == filters[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),

                child: GestureDetector(

                  onTap: () {
                    setState(() {
                      selectedFilter = filters[index];
                    });
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xff6D4C41)
                          : Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                        ),
                      ],
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

        Expanded(
            child: ListView(
                children: offers
                    .asMap()
                    .entries
                    .where((entry) {

                  final offer = entry.value;

                  final search = _searchController.text
                      .toLowerCase();

                  final matchSearch =
                      offer["title"]
                          .toString()
                          .toLowerCase()
                          .contains(search) ||
                          offer["coupon"]
                              .toString()
                              .toLowerCase()
                              .contains(search);

                  bool matchFilter = true;

                  if (selectedFilter != "All") {
                    matchFilter =
                        offer["status"] ==
                            selectedFilter;
                  }

                  return matchSearch &&
                      matchFilter;

                }).map((entry) {

                  final int index = entry.key;

                  final Map<String, dynamic> offer =
                      entry.value;

                  final bool active =
                      offer["status"] == "Active";

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 18,
                    ),

                    padding:
                    const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                          18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [

                    Row(
                    children: [

                    Container(
                    width: 55,
                      height: 55,

                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                            0xff6D4C41)
                            .withOpacity(
                            .12),
                        borderRadius:
                        BorderRadius
                            .circular(
                            14),
                      ),

                      child: const Icon(
                        Icons.local_offer,
                        color: Color(
                            0xff6D4C41),
                      ),
                    ),

                    const SizedBox(
                      width: 14,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          Text(
                            offer["title"],
                            style:
                            const TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            "Coupon : ${offer["coupon"]}",
                            style:
                            const TextStyle(
                              color:
                              Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration:
                      BoxDecoration(
                        color: active
                            ? Colors.green
                            .shade50
                            : Colors.red
                            .shade50,
                        borderRadius:
                        BorderRadius
                            .circular(
                            20),
                      ),

                      child: Text(
                        offer["status"],
                        style: TextStyle(
                          color: active
                              ? Colors.green
                              : Colors.red,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                    ),

                    ],
                  ),

                  const SizedBox(height: 18),
                        Row(
                          children: [

                            const Icon(
                              Icons.discount,
                              color: Color(0xff6D4C41),
                            ),

                            const SizedBox(width: 8),

                            Text(
                              "Discount : ${offer["discount"]}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [

                            const Icon(
                              Icons.calendar_today,
                              size: 18,
                              color: Color(0xff6D4C41),
                            ),

                            const SizedBox(width: 8),

                            Text(
                              "Valid Till : ${offer["valid"]}",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [

                            Expanded(
                              child: ElevatedButton.icon(

                                onPressed: () {

                                  editingIndex = index;

                                  _offerNameController.text =
                                  offer["title"];

                                  _couponController.text =
                                  offer["coupon"];

                                  _discountController.text =
                                      offer["discount"]
                                          .toString()
                                          .replaceAll("%", "");

                                  _validityController.text =
                                  offer["valid"];

                                  _showOfferSheet();
                                },

                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                ),

                                label: const Text(
                                  "Edit",
                                ),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xff6D4C41),
                                  foregroundColor: Colors.white,
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

                                onPressed: () {

                                  showDialog(
                                    context: context,

                                    builder: (context) {

                                      return AlertDialog(

                                        title: const Text(
                                          "Delete Offer",
                                        ),

                                        content: const Text(
                                          "Are you sure you want to delete this offer?",
                                        ),

                                        actions: [

                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cancel",
                                            ),
                                          ),

                                          ElevatedButton(
                                            onPressed: () {

                                              setState(() {
                                                offers.removeAt(index);
                                              });

                                              Navigator.pop(context);

                                            },

                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),

                                            child: const Text(
                                              "Delete",
                                            ),

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

                                label: const Text(
                                  "Delete",
                                ),

                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(
                                    color: Colors.red,
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

            ),
        ),

            ],
        ),
      ),
    );
  }

  Widget _topCard(
      String value,
      String title,
      Color color,
      ) {
    return Column(
      children: [

        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),

        const SizedBox(height: 4),

        Text(title),

      ],
    );
  }

  void _showOfferSheet() {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),

      builder: (context) {

        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom:
            MediaQuery.of(context).viewInsets.bottom + 20,
          ),

          child: SingleChildScrollView(

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                Text(
                  editingIndex == -1
                      ? "Create Offer"
                      : "Edit Offer",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6D4C41),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _offerNameController,
                  decoration: const InputDecoration(
                    labelText: "Offer Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: _couponController,
                  decoration: const InputDecoration(
                    labelText: "Coupon Code",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: _discountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Discount %",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: _validityController,
                  decoration: const InputDecoration(
                    labelText: "Valid Till",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    onPressed: () {

                      if (editingIndex == -1) {

                        setState(() {

                          offers.add({

                            "title":
                            _offerNameController.text,

                            "coupon":
                            _couponController.text,

                            "discount":
                            "${_discountController.text}%",

                            "status": "Active",

                            "valid":
                            _validityController.text,

                          });

                        });

                      } else {

                        setState(() {

                          offers[editingIndex] = {

                            "title":
                            _offerNameController.text,

                            "coupon":
                            _couponController.text,

                            "discount":
                            "${_discountController.text}%",

                            "status":
                            offers[editingIndex]["status"],

                            "valid":
                            _validityController.text,

                          };

                        });

                      }

                      Navigator.pop(context);

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xff6D4C41),
                      foregroundColor: Colors.white,
                      minimumSize:
                      const Size(double.infinity, 52),
                    ),

                    child: Text(
                      editingIndex == -1
                          ? "Create Offer"
                          : "Update Offer",
                    ),

                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _offerNameController.dispose();
    _couponController.dispose();
    _discountController.dispose();
    _validityController.dispose();
    super.dispose();
  }
}