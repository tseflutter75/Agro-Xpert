import 'package:flutter/material.dart';

class FishScreen extends StatefulWidget {
  const FishScreen({super.key});

  @override
  State<FishScreen> createState() => _FishScreenState();
}

class _FishScreenState extends State<FishScreen> {
  final List<String> items = [
    'রুই',
    'কাতলা',
    'মৃগেল',
    'তেলাপিয়া',
    'পাঙ্গাশ',
    'সিলভার কার্প',
    'গ্রাস কার্প',
    'চিংড়ি',
    'ইলিশ',
    'শিং',
    'মাগুর',
    'অন্যান্য',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("মৎস্য"),
        centerTitle: true,
        backgroundColor: Color(0xFF0EA5E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // প্রতি row-তে ৩টি item
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.8,
          ),
          itemBuilder: (context, index) {
            final bool isSelected = selectedItemList.contains(items[index]);

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedItemList.remove(items[index]);
                  } else {
                    selectedItemList.add(items[index]);
                  }
                });

                print(selectedItemList);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF0EA5E9) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF0EA5E9) : Colors.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
