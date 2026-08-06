import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'Fill_DETAIL_OF_CLLOTHS_Seller.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => AddProductPageState();
}

class AddProductPageState extends State<AddProductPage> {

  final Color primary = const Color(0xff6B4A3A);
  final Color bgColor = const Color(0xffF8F5F2);

  final ImagePicker _picker = ImagePicker();

  List<File> images = [];
  Future<void> pickImages(ImageSource source) async {
    if (source == ImageSource.gallery) {
      final List<XFile> pickedImages = await _picker.pickMultiImage();

      if (pickedImages.isNotEmpty) {
        setState(() {
          images.addAll(
            pickedImages.map((e) => File(e.path)).toList(),
          );
        });
      }
    } else {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo != null) {
        setState(() {
          images.add(File(photo.path));
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Product",
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        iconTheme: IconThemeData(color: primary),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Upload Product Images",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Upload front, back and side images for better AI detection.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 22),

            DottedBorder(
              color: primary,
              dashPattern: const [8,4],
              strokeWidth: 2,
              borderType: BorderType.RRect,
              radius: const Radius.circular(18),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 16,
                ),

                child: Column(
                  children: [

                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 65,
                      color: primary,
                    ),

                    const SizedBox(height: 14),

                    Text(
                      "Upload Product Images",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Front • Back • Side",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Row(
                      children: [

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              pickImages(ImageSource.camera);
                            },

                            icon: const Icon(Icons.camera_alt),

                            label: const Text("Camera"),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(0,52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              pickImages(ImageSource.gallery);
                            },

                            icon: Icon(
                              Icons.photo_library,
                              color: primary,
                            ),

                            label: Text(
                              "Gallery",
                              style: TextStyle(color: primary),
                            ),

                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(0,52),
                              side: BorderSide(color: primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 22),

                    if (images.isNotEmpty) ...[
                      const SizedBox(height: 18),

                      SizedBox(
                        height: 95,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      images[index],
                                      width: 95,
                                      height: 95,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          images.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "How do you want to fill product details?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) => const FillDetailsSelfPage(),

                  ),

                );

              },

              child: Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 10,
                      offset: const Offset(0,4),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    CircleAvatar(
                      radius: 28,
                      backgroundColor: primary.withOpacity(.12),
                      child: Icon(
                        Icons.edit_note,
                        color: primary,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Fill Details by Yourself",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Enter all product information manually.",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: primary,
                      size: 18,
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),
            GestureDetector(

              onTap: () {},

              child: Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xff6B4A3A),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: const Offset(0,4),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Fill Details with AI",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "AI will detect category, color, fabric, description, sizes and more.",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
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
