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
                  color: isSelected ? Color(0xFFF97316) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFFF97316) : Colors.grey,
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
