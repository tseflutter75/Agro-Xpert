import 'package:flutter/material.dart';

class EggScreen extends StatefulWidget {
  const EggScreen({super.key});

  @override
  State<EggScreen> createState() => _EggScreenState();
}

class _EggScreenState extends State<EggScreen> {
  final List<String> items = [
    'ফার্মের ডিম (লাল)',
    'ফার্মের ডিম (সাদা)',
    'দেশি মুরগির ডিম',
    'হাঁসের ডিম',
    'কোয়েলের ডিম',
    'অর্গানিক ডিম',
    'অন্যান্য',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ডিম"),
        centerTitle: true,
        backgroundColor: Color(0xFFF97316),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // Check if the current item is selected
                  final bool isSelected = selectedItemList.contains(
                    items[index],
                  );

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedItemList.remove(items[index]);
                          } else {
                            selectedItemList.add(items[index]);
                          }
                          print(selectedItemList);
                        });
                      },
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          // Use individual item state here
                          color: isSelected
                              ? Color(
                                  0xFFF97316,
                                ) // Change to AppColor.primaryGreen if defined
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 12,
                              // Optional: Change text color so it's readable on green
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
