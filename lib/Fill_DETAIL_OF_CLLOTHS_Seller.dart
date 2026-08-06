import 'package:flutter/material.dart';

class FillDetailsSelfPage extends StatefulWidget {
  const FillDetailsSelfPage({super.key});

  @override
  State<FillDetailsSelfPage> createState() =>
      FillDetailsSelfPageState();
}

class FillDetailsSelfPageState
    extends State<FillDetailsSelfPage> {

  final Color primary = const Color(0xff6B4A3A);
  final Color bgColor = const Color(0xffF8F5F2);

  final TextEditingController productNameController =
  TextEditingController();

  final TextEditingController brandController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  final TextEditingController priceController =
  TextEditingController();

  final TextEditingController discountController =
  TextEditingController();

  final TextEditingController stockController =
  TextEditingController();

  final TextEditingController fabricController =
  TextEditingController();

  final TextEditingController gstController =
  TextEditingController();

  String selectedCategory = "T-Shirt";

  final List<String> categoryList = [

    "T-Shirt",

    "Shirt",

    "Jeans",

    "Kurta",

    "Hoodie",

    "Jacket",

    "Dress",

    "Top",

    "Saree",

    "Shoes",

  ];

  List<String> sizes = [

    "S",

    "M",

    "L",

    "XL",

    "XXL",

  ];

  List<String> selectedSizes = [];

  List<Color> colors = [

    Colors.black,

    Colors.white,

    Colors.blue,

    Colors.red,

    Colors.green,

    Colors.orange,

    Colors.purple,

    Colors.brown,

  ];

  List<Color> selectedColors = [];

  String deliveryTime = "Same Day";

  double finalPrice = 0;

  void calculatePrice() {

    double price =
        double.tryParse(priceController.text) ?? 0;

    double discount =
        double.tryParse(discountController.text) ?? 0;

    setState(() {

      finalPrice =
          price - (price * discount / 100);

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: bgColor,

        appBar: AppBar(

          backgroundColor: bgColor,

          elevation: 0,

          centerTitle: true,

          iconTheme: IconThemeData(
            color: primary,
          ),

          title: Text(

            "Product Details",

            style: TextStyle(

              color: primary,

              fontWeight: FontWeight.bold,

              fontSize: 22,

            ),

          ),

        ),

        body: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

            const Text(

            "Product Name",

            style: TextStyle(

              fontSize: 16,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          TextField(

            controller: productNameController,

            decoration: InputDecoration(

              hintText: "Enter Product Name",

              filled: true,

              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(15),

                borderSide: BorderSide.none,

              ),

            ),

          ),

          const SizedBox(height: 20),

          const Text(

            "Category",

            style: TextStyle(

              fontSize: 16,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(

            value: selectedCategory,

            decoration: InputDecoration(

              filled: true,

              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(15),

                borderSide: BorderSide.none,

              ),

            ),

            items: categoryList.map((item) {

              return DropdownMenuItem(

                value: item,

                child: Text(item),

              );

            }).toList(),

            onChanged: (value) {

              setState(() {

                selectedCategory = value!;

              });

            },

          ),
          const SizedBox(height: 20),

          const Text(
            "Brand",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: brandController,
            decoration: InputDecoration(
              hintText: "Enter Brand Name",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: descriptionController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Write product description...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            "Available Sizes",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: sizes.map((size) {

              bool selected =
              selectedSizes.contains(size);

              return FilterChip(

                label: Text(size),

                selected: selected,

                selectedColor:
                primary.withOpacity(.15),

                checkmarkColor: primary,

                onSelected: (value) {

                  setState(() {

                    if (selected) {

                      selectedSizes.remove(size);

                    } else {

                      selectedSizes.add(size);

                    }

                  });

                },

              );

            }).toList(),
          ),

          const SizedBox(height: 22),

          const Text(
            "Available Colors",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,

            children: colors.map((color) {

              bool selected =
              selectedColors.contains(color);

              return GestureDetector(

                onTap: () {

                  setState(() {

                    if (selected) {

                      selectedColors.remove(color);

                    } else {

                      selectedColors.add(color);

                    }

                  });

                },

                child: Container(

                  width: 38,
                  height: 38,

                  decoration: BoxDecoration(

                    color: color,

                    shape: BoxShape.circle,

                    border: Border.all(
                      color: selected
                          ? primary
                          : Colors.grey.shade300,
                      width: selected ? 3 : 1,
                    ),

                  ),

                ),

              );

            }).toList(),

          ),
            const SizedBox(height: 22),

            const Text(
              "Price",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calculatePrice();
              },
              decoration: InputDecoration(
                hintText: "₹ Enter Product Price",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Discount (%)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: discountController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calculatePrice();
              },
              decoration: InputDecoration(
                hintText: "Enter Discount %",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: const Color(0xffEFE5DF),
              borderRadius: BorderRadius.circular(15),
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Final Price",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "₹${finalPrice.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),

            ],
          ),
        ),

      const SizedBox(height: 24),

      const Text(
        "Stock Quantity",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      TextField(
        controller: stockController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter Available Stock",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),

      const SizedBox(height: 20),

      const Text(
        "Delivery Time",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      DropdownButtonFormField<String>(
        value: deliveryTime,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        items: const [

          DropdownMenuItem(
            value: "Same Day",
            child: Text("Same Day"),
          ),

          DropdownMenuItem(
            value: "1 Day",
            child: Text("1 Day"),
          ),

          DropdownMenuItem(
            value: "2 Days",
            child: Text("2 Days"),
          ),

          DropdownMenuItem(
            value: "3 Days",
            child: Text("3 Days"),
          ),

        ],
        onChanged: (value) {

          setState(() {

            deliveryTime = value!;

          });

        },
      ),

      const SizedBox(height: 22),

      const Text(
        "Fabric",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      TextField(
        controller: fabricController,
        decoration: InputDecoration(
          hintText: "Cotton / Denim / Linen...",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 20),

      const Text(
        "GST (Optional)",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      TextField(
        controller: gstController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter GST %",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),

      const SizedBox(height: 35),

      SizedBox(
        width: double.infinity,
        height: 58,

        child: ElevatedButton(

          onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(

              const SnackBar(
                content: Text(
                  "Product Saved Successfully",
                ),
              ),

            );

          },

          style: ElevatedButton.styleFrom(

            backgroundColor: primary,

            elevation: 0,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(18),

            ),

          ),

          child: const Text(

            "Save Product",

            style: TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

              color: Colors.white,

            ),

          ),

        ),
      ),

      const SizedBox(height: 30),

      ],
    ),
    ),
    );
  }
}