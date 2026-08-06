import 'package:flutter/material.dart';

class SellerCreateAccountScreen extends StatefulWidget {
  const SellerCreateAccountScreen({super.key});

  @override
  State<SellerCreateAccountScreen> createState() =>
      _SellerCreateAccountScreenState();
}

class _SellerCreateAccountScreenState
    extends State<SellerCreateAccountScreen> {

  int currentStep = 0;
  bool isPhoneVerified = false;
  bool showOtpBox = false;

  final TextEditingController otpController =
  TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  // STEP 1
  final TextEditingController ownerNameController =
  TextEditingController();

  final TextEditingController mobileController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  // STEP 2
  final TextEditingController shopNameController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();

  final TextEditingController cityController =
  TextEditingController();

  final TextEditingController pincodeController =
  TextEditingController();

  String? selectedCategory;

  // STEP 3
  String? logoPath;
  String? bannerPath;

  final List<String> categories = [
    "Men's Wear",
    "Women's Wear",
    "Kids Wear",
    "Footwear",
    "Accessories",
    "Mixed Fashion"
  ];

  void nextStep() {

    if (currentStep == 0) {

      if (_formKey1.currentState!.validate()) {
        if (!isPhoneVerified) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please Verify Your Mobile Number"),
            ),
          );

          return;

        }

        setState(() {
          currentStep = 1;
        });

      }

    } else if (currentStep == 1) {

      if (_formKey2.currentState!.validate()) {

        if (selectedCategory == null) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please Select Shop Category"),
            ),
          );

          return;

        }

        setState(() {
          currentStep = 2;
        });

      }

    } else {

      if (_formKey3.currentState!.validate()) {

        if (logoPath == null || bannerPath == null) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Upload Shop Logo and Shop Banner"),
            ),
          );

          return;

        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Seller Account Created Successfully"),
          ),
        );

      }

    }

  }

  Widget progressBar() {

    return Row(
      children: [

        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: currentStep >= 0
                  ? Colors.brown
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: currentStep >= 1
                  ? Colors.brown
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: currentStep >= 2
                  ? Colors.brown
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

      ],
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF8F5F2),

      appBar: AppBar(

        backgroundColor: const Color(0xffF8F5F2),

        elevation: 0,

        title: const Text(
          "Create Seller Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),

        iconTheme:
        const IconThemeData(color: Colors.black),

      ),

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              progressBar(),

              const SizedBox(height: 15),

              Text(

                "Step ${currentStep + 1} of 3",

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 18,

                ),

              ),

              const SizedBox(height: 20),

              Expanded(

                child: SingleChildScrollView(

                  child: currentStep == 0
                      ? buildStep1()
                      : currentStep == 1
                      ? buildStep2()
                      : buildStep3(),

                ),

              ),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed: nextStep,

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    const Color(0xff6B4A3A),

                    shape: RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(14),

                    ),

                  ),

                  child: Text(

                    currentStep == 2
                        ? "Finish"
                        : "Continue",

                    style: const TextStyle(

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

    );

  }
  Widget buildStep1() {

    return Form(

      key: _formKey1,

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Owner Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(

            controller: ownerNameController,

            decoration: InputDecoration(

              hintText: "Enter Owner Name",

              prefixIcon: const Icon(Icons.person_outline),

              filled: true,

              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(14),

                borderSide: BorderSide.none,

              ),

            ),

            validator: (value) {

              if (value == null || value.trim().isEmpty) {

                return "Owner Name is required";

              }

              return null;

            },

          ),

          const SizedBox(height: 20),

          const Text(
            "Mobile Number",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(

            controller: mobileController,

            keyboardType: TextInputType.phone,

            maxLength: 10,

            decoration: InputDecoration(

              counterText: "",

              hintText: "Enter Mobile Number",

              prefixIcon: const Icon(Icons.phone),

              filled: true,

              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(14),

                borderSide: BorderSide.none,

              ),

            ),

            validator: (value) {

              if (value == null || value.isEmpty) {

                return "Mobile Number is required";

              }

              if (value.length != 10) {

                return "Enter valid 10 digit number";

              }

              return null;

            },

          ),
          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: isPhoneVerified
                  ? null
                  : () {
                if (mobileController.text.length == 10) {
                  setState(() {
                    showOtpBox = true;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("OTP Sent Successfully"),
                    ),
                  );
                }
              },
              child: Text(
                isPhoneVerified ? "Verified ✓" : "Verify",
              ),
            ),
          ),
          if (showOtpBox) ...[

            const SizedBox(height: 15),

            const Text(
              "Enter OTP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                counterText: "",
                hintText: "Enter 6 Digit OTP",
                prefixIcon: const Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

          ],
          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                if (isPhoneVerified) return;

                if (otpController.text == "123456") {

                  setState(() {
                    isPhoneVerified = true;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Phone Verified Successfully"),
                    ),
                  );

                } else {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid OTP"),
                    ),
                  );

                }

              },
              child: Text(
                isPhoneVerified ? "OTP Verified ✓" : "Verify OTP",
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Email (Optional)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(

            controller: emailController,

            keyboardType: TextInputType.emailAddress,

            decoration: InputDecoration(

              hintText: "Enter Email",

              prefixIcon: const Icon(Icons.email_outlined),

              filled: true,

              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(14),

                borderSide: BorderSide.none,

              ),

            ),

          ),

        ],

      ),

    );

  }
  Widget buildStep2() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Shop Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: shopNameController,
            decoration: InputDecoration(
              hintText: "Enter Shop Name",
              prefixIcon: const Icon(Icons.store),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Shop Name is required";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Shop Category",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: selectedCategory,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.category),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            hint: const Text("Select Category"),
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Shop Address",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: addressController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Enter Shop Address",
              prefixIcon: const Icon(Icons.location_on),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Address is required";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "City",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: cityController,
            decoration: InputDecoration(
              hintText: "Enter City",
              prefixIcon: const Icon(Icons.location_city),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "City is required";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Pincode",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: pincodeController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: InputDecoration(
              counterText: "",
              hintText: "Enter Pincode",
              prefixIcon: const Icon(Icons.pin_drop),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Pincode is required";
              }

              if (value.length != 6) {
                return "Enter valid 6 digit pincode";
              }

              return null;
            },
          ),

        ],
      ),
    );
  }
  Widget buildStep3() {
    return Form(
      key: _formKey3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Complete Your Shop Profile",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Upload your shop logo and banner to make your shop attractive.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Shop Logo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {

              // Image Picker later

              setState(() {
                logoPath = "selected";
              });

            },
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.brown.shade200,
                ),
              ),
              child: logoPath == null
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.add_a_photo,
                    size: 40,
                    color: Colors.brown,
                  ),

                  SizedBox(height: 10),

                  Text("Upload Shop Logo"),

                ],
              )
                  : const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 45,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Shop Banner",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {

              setState(() {
                bannerPath = "selected";
              });

            },
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.brown.shade200,
                ),
              ),
              child: bannerPath == null
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.image,
                    size: 45,
                    color: Colors.brown,
                  ),

                  SizedBox(height: 10),

                  Text("Upload Shop Banner"),

                ],
              )
                  : const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 45,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Opening Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            decoration: InputDecoration(
              hintText: "09:00 AM",
              prefixIcon: const Icon(Icons.access_time),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Closing Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            decoration: InputDecoration(
              hintText: "09:00 PM",
              prefixIcon: const Icon(Icons.lock_clock),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 30),

        ],
      ),
    );
  }

}