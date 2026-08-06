import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShopProfilePage extends StatefulWidget {
  const ShopProfilePage({super.key});

  @override
  State<ShopProfilePage> createState() =>
      _ShopProfilePageState();
}

class _ShopProfilePageState
    extends State<ShopProfilePage> {

  final ImagePicker _picker = ImagePicker();

  File? shopBannerImage;

  File? shopFrontImage;

  final TextEditingController ownerController =
  TextEditingController(text: "Anish Mishra");

  final TextEditingController shopController =
  TextEditingController(text: "Stitch Swift");

  final TextEditingController phoneController =
  TextEditingController(text: "9876543210");

  final TextEditingController emailController =
  TextEditingController(
    text: "stitchswift@gmail.com",
  );

  final TextEditingController categoryController =
  TextEditingController(
    text: "Fashion Store",
  );

  final TextEditingController gstController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController(
    text: "Bhopal, Madhya Pradesh",
  );

  final TextEditingController cityController =
  TextEditingController(
    text: "Bhopal",
  );

  final TextEditingController pincodeController =
  TextEditingController(
    text: "462001",
  );

  final TextEditingController openingController =
  TextEditingController(
    text: "09:00 AM",
  );

  final TextEditingController closingController =
  TextEditingController(
    text: "09:00 PM",
  );

  bool homeDelivery = true;

  bool pickupAvailable = true;

  bool shopOpen = true;

  Future<void> _pickImage(
      ImageSource source,
      bool isBanner,
      ) async {

    final XFile? pickedFile =
    await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile == null) return;

    setState(() {

      if (isBanner) {

        shopBannerImage =
            File(pickedFile.path);

      } else {

        shopFrontImage =
            File(pickedFile.path);

      }

    });

  }

  void _showImagePicker(
      bool isBanner,
      ) {

    showModalBottomSheet(

      context: context,

      shape: const RoundedRectangleBorder(

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),

      ),

      builder: (context) {

        return SafeArea(

          child: Padding(

            padding:
            const EdgeInsets.all(20),

            child: Column(

              mainAxisSize:
              MainAxisSize.min,

              children: [

                Text(

                  isBanner
                      ? "Change Shop Banner"
                      : "Change Shop Image",

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                    color:
                    Color(0xff6D4C41),
                  ),

                ),

                const SizedBox(height: 20),

                ListTile(

                  leading: const Icon(
                    Icons.camera_alt,
                    color: Color(0xff6D4C41),
                  ),

                  title: const Text(
                    "Camera",
                  ),

                  onTap: () {

                    Navigator.pop(context);

                    _pickImage(
                      ImageSource.camera,
                      isBanner,
                    );

                  },

                ),

                ListTile(

                  leading: const Icon(
                    Icons.photo,
                    color: Color(0xff6D4C41),
                  ),

                  title: const Text(
                    "Gallery",
                  ),

                  onTap: () {

                    Navigator.pop(context);

                    _pickImage(
                      ImageSource.gallery,
                      isBanner,
                    );

                  },

                ),

                const SizedBox(height: 10),

              ],

            ),

          ),

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor:
        const Color(0xffF8F4EE),

        appBar: AppBar(

          backgroundColor:
          const Color(0xffF8F4EE),

          elevation: 0,

          centerTitle: true,

          iconTheme:
          const IconThemeData(
            color: Color(0xff6D4C41),
          ),

          title: const Text(

            "Shop Profile",

            style: TextStyle(

              color:
              Color(0xff6D4C41),

              fontWeight:
              FontWeight.bold,

              fontSize: 22,

            ),

          ),

        ),

        body: SingleChildScrollView(

            padding:
            const EdgeInsets.all(16),

            child: Column(

                children: [
              Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Shop Banner",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D4C41),
                ),
              ),
            ),

          const SizedBox(height: 10),

          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffE6D4C5),
              borderRadius: BorderRadius.circular(20),
              image: shopBannerImage != null
                  ? DecorationImage(
                image: FileImage(shopBannerImage!),
                fit: BoxFit.cover,
              )
                  : null,
            ),

            child: Stack(
              children: [

                if (shopBannerImage == null)
                  const Center(
                    child: Icon(
                      Icons.image,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),

                Positioned(
                  right: 15,
                  bottom: 15,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor:
                    const Color(0xff6D4C41),
                    child: IconButton(
                      onPressed: () {
                        _showImagePicker(true);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 28),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Shop Front Image",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff6D4C41),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffE6D4C5),
              borderRadius: BorderRadius.circular(20),
              image: shopFrontImage != null
                  ? DecorationImage(
                image: FileImage(shopFrontImage!),
                fit: BoxFit.cover,
              )
                  : null,
            ),

            child: Stack(
              children: [

                if (shopFrontImage == null)
                  const Center(
                    child: Icon(
                      Icons.storefront,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),

                Positioned(
                  right: 15,
                  bottom: 15,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor:
                    const Color(0xff6D4C41),
                    child: IconButton(
                      onPressed: () {
                        _showImagePicker(false);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 28),

          _buildSectionTitle(
            "Shop Information",
          ),

          const SizedBox(height: 16),
          _buildTextField(
            controller: ownerController,
            label: "Owner Name",
            icon: Icons.person_outline,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: shopController,
            label: "Shop Name",
            icon: Icons.store_outlined,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: phoneController,
            label: "Mobile Number",
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: emailController,
            label: "Email Address",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: categoryController,
            label: "Shop Category",
            icon: Icons.category_outlined,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: gstController,
            label: "GST Number (Optional)",
            icon: Icons.receipt_long_outlined,
          ),

          const SizedBox(height: 28),

          _buildSectionTitle(
            "Shop Address",
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: addressController,
            label: "Shop Address",
            icon: Icons.location_on_outlined,
            maxLines: 2,
          ),

          const SizedBox(height: 16),

          Row(
            children: [

              Expanded(
                child: _buildTextField(
                  controller: cityController,
                  label: "City",
                  icon: Icons.location_city_outlined,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: _buildTextField(
                  controller: pincodeController,
                  label: "Pincode",
                  icon: Icons.pin_drop_outlined,
                  keyboardType: TextInputType.number,
                ),
              ),

            ],
          ),

          const SizedBox(height: 28),

          _buildSectionTitle(
            "Business Details",
          ),

          const SizedBox(height: 16),
                  Row(
                    children: [

                      Expanded(
                        child: _buildTextField(
                          controller: openingController,
                          label: "Opening Time",
                          icon: Icons.access_time_outlined,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: _buildTextField(
                          controller: closingController,
                          label: "Closing Time",
                          icon: Icons.access_time_filled_outlined,
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 28),

                  _buildSectionTitle(
                    "Shop Settings",
                  ),

                  const SizedBox(height: 16),

                  _buildSwitchTile(
                    title: "Home Delivery",
                    subtitle: "Enable Home Delivery Service",
                    icon: Icons.delivery_dining_outlined,
                    value: homeDelivery,
                    onChanged: (value) {
                      setState(() {
                        homeDelivery = value;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  _buildSwitchTile(
                    title: "Pickup Available",
                    subtitle: "Customer Can Pickup Orders",
                    icon: Icons.shopping_bag_outlined,
                    value: pickupAvailable,
                    onChanged: (value) {
                      setState(() {
                        pickupAvailable = value;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  _buildSwitchTile(
                    title: "Shop Open",
                    subtitle: "Show Shop Online To Customers",
                    icon: Icons.storefront_outlined,
                    value: shopOpen,
                    onChanged: (value) {
                      setState(() {
                        shopOpen = value;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(

                      onPressed: () {

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(

                            content: Text(
                              "Shop Profile Updated Successfully",
                            ),

                          ),

                        );

                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xff6D4C41),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(16),
                        ),
                      ),

                      icon: const Icon(
                        Icons.save,
                      ),

                      label: const Text(
                        "Save Changes",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                  ),

                  const SizedBox(height: 25),

                ],

            ),

        ),

    );

  }
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff6D4C41),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,

      decoration: InputDecoration(

        filled: true,
        fillColor: Colors.white,

        prefixIcon: Icon(
          icon,
          color: const Color(0xff6D4C41),
        ),

        labelText: label,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xff6D4C41),
            width: 1.4,
          ),
        ),

      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {

    return Container(

      padding: const EdgeInsets.all(15),

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

        children: [

          CircleAvatar(

            radius: 22,

            backgroundColor:
            const Color(0xff6D4C41).withOpacity(.12),

            child: Icon(
              icon,
              color: const Color(0xff6D4C41),
            ),

          ),

          const SizedBox(width: 14),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

              ],

            ),

          ),

          Switch(
            value: value,
            activeColor: const Color(0xff6D4C41),
            onChanged: onChanged,
          ),

        ],

      ),

    );

  }

  @override
  void dispose() {

    ownerController.dispose();
    shopController.dispose();
    phoneController.dispose();
    emailController.dispose();
    categoryController.dispose();
    gstController.dispose();
    addressController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    openingController.dispose();
    closingController.dispose();

    super.dispose();

  }

}