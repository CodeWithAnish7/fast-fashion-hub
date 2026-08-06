import 'package:flutter/material.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {

  final List<Map<String, dynamic>> faqs = [

    {
      "question": "How can I add a new product?",
      "answer":
      "Open Add Product from the dashboard, fill all details, upload product images and tap Save Product.",
      "expanded": false,
    },

    {
      "question": "How can I edit my product?",
      "answer":
      "Go to Manage Products, choose any product and tap the Edit button.",
      "expanded": false,
    },

    {
      "question": "How do I update my shop profile?",
      "answer":
      "Open Shop Profile and tap the camera icon to change your shop image or banner.",
      "expanded": false,
    },

    {
      "question": "How do I create offers?",
      "answer":
      "Open Offers & Coupons and tap the + button to create a new offer.",
      "expanded": false,
    },

    {
      "question": "How do I contact support?",
      "answer":
      "Use the Contact Support section below to call or email our support team.",
      "expanded": false,
    },

  ];
  bool showReportForm = false;

  String? selectedCategory;

  final TextEditingController subjectController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

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

            "Help & Support",

            style: TextStyle(
              color: Color(0xff6D4C41),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

          ),

        ),

        body: Padding(

            padding: const EdgeInsets.all(16),

            child: ListView(

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
          child: Column(
            children: [

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffF3E5E1),
                  child: Icon(
                    Icons.call,
                    color: Color(0xff6D4C41),
                  ),
                ),
                title: const Text(
                  "Call Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "+91 98765 43210",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {

                },
              ),

              const Divider(),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffF3E5E1),
                  child: Icon(
                    Icons.email_outlined,
                    color: Color(0xff6D4C41),
                  ),
                ),
                title: const Text(
                  "Email Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "support@stitchswift.com",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {

                },
              ),

              const Divider(),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffF3E5E1),
                  child: Icon(
                    Icons.bug_report_outlined,
                    color: Color(0xff6D4C41),
                  ),
                ),
                title: const Text(
                  "Report a Problem",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Tell us about your issue",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {

                  setState(() {

                    showReportForm = !showReportForm;

                  });

                },
              ),

              const Divider(),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffF3E5E1),
                  child: Icon(
                    Icons.chat_outlined,
                    color: Color(0xff6D4C41),
                  ),
                ),
                title: const Text(
                  "Live Chat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Coming Soon",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {

                },
              ),

            ],
          ),
        ),

      const SizedBox(height: 22),

      const Text(
        "Frequently Asked Questions",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff6D4C41),
        ),
      ),
        const SizedBox(height: 22),

        if (showReportForm)
    Container(
      margin: const EdgeInsets.only(bottom: 22),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Report a Problem",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff6D4C41),
            ),
          ),

          const SizedBox(height: 18),

          DropdownButtonFormField<String>(
            value: selectedCategory,
            decoration: InputDecoration(
              labelText: "Problem Category",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: const [

              DropdownMenuItem(
                value: "Product Issue",
                child: Text("Product Issue"),
              ),

              DropdownMenuItem(
                value: "Order Issue",
                child: Text("Order Issue"),
              ),

              DropdownMenuItem(
                value: "Payment Issue",
                child: Text("Payment Issue"),
              ),

              DropdownMenuItem(
                value: "Shop Profile Issue",
                child: Text("Shop Profile Issue"),
              ),

              DropdownMenuItem(
                value: "App Bug",
                child: Text("App Bug"),
              ),

              DropdownMenuItem(
                value: "Other",
                child: Text("Other"),
              ),

            ],
            onChanged: (value) {

              setState(() {

                selectedCategory = value;

              });

            },
          ),

          const SizedBox(height: 18),

          TextField(
            controller: subjectController,
            decoration: InputDecoration(
              labelText: "Subject",
              hintText: "Enter Subject",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 18),
          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: "Describe Your Problem",
              hintText: "Write your issue here...",
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {

                if (selectedCategory == null ||
                    subjectController.text.trim().isEmpty ||
                    descriptionController.text.trim().isEmpty) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please fill all the fields.",
                      ),
                    ),
                  );

                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Report submitted successfully.",
                    ),
                  ),
                );

                setState(() {

                  selectedCategory = null;

                  subjectController.clear();

                  descriptionController.clear();

                  showReportForm = false;

                });

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6D4C41),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Submit Report",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
    ),

      const SizedBox(height: 14),
        ...faqs.asMap().entries.map((entry) {

      int index = entry.key;

      var faq = entry.value;

      return Container(

        margin: const EdgeInsets.only(bottom: 12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
            ),
          ],
        ),

        child: ExpansionTile(

          initiallyExpanded: faq["expanded"],

          tilePadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 4,
          ),

          iconColor: const Color(0xff6D4C41),

          collapsedIconColor:
          const Color(0xff6D4C41),

          title: Text(

            faq["question"],

            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff6D4C41),
            ),

          ),

          children: [

            Padding(

              padding: const EdgeInsets.fromLTRB(
                18,
                0,
                18,
                18,
              ),

              child: Text(

                faq["answer"],

                style: const TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),

              ),

            ),

          ],

        ),

      );

    }).toList(),

    const SizedBox(height: 25),
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
                    child: Column(
                      children: [

                        const Icon(
                          Icons.info_outline,
                          color: Color(0xff6D4C41),
                          size: 40,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Stitch Swift Seller",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6D4C41),
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Version 1.0.0",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Need more help?\nOur support team is always ready to assist you.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                ],
            ),
        ),
    );
  }
}