import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  final TextEditingController flatController =
  TextEditingController();

  final TextEditingController streetController =
  TextEditingController();

  final TextEditingController colonyController =
  TextEditingController();

  final TextEditingController cityController =
  TextEditingController();

  final TextEditingController stateController =
  TextEditingController();

  final TextEditingController countryController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // BACK BUTTON
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    "My Address",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // TOP CARD
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 40,
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "Add your delivery address for faster shopping and easy deliveries.",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(23.2599, 77.4126),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.sage',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              buildField(
                controller: flatController,
                label: "Flat / House Number",
                icon: Icons.home,
              ),

              const SizedBox(height: 15),

              buildField(
                controller: streetController,
                label: "Street / Gali Name",
                icon: Icons.route,
              ),

              const SizedBox(height: 15),

              buildField(
                controller: colonyController,
                label: "Colony / Area",
                icon: Icons.location_city,
              ),

              const SizedBox(height: 15),

              buildField(
                controller: cityController,
                label: "City",
                icon: Icons.location_on,
              ),

              const SizedBox(height: 15),

              buildField(
                controller: stateController,
                label: "State",
                icon: Icons.map,
              ),

              const SizedBox(height: 15),

              buildField(
                controller: countryController,
                label: "Country",
                icon: Icons.public,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  onPressed: () {

                    if (flatController.text.trim().isEmpty ||
                        streetController.text.trim().isEmpty ||
                        colonyController.text.trim().isEmpty ||
                        cityController.text.trim().isEmpty ||
                        stateController.text.trim().isEmpty ||
                        countryController.text.trim().isEmpty) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Please fill all address fields",
                          ),
                        ),
                      );

                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Address Saved Successfully",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Save Address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        prefixIcon: Icon(icon),

        hintText: label,

        filled: true,
        fillColor: Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
      ),
    );
  }
}