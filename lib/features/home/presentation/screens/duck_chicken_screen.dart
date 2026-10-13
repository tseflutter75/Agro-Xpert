import 'package:flutter/material.dart';

class ChickenDuckScreen extends StatefulWidget {
  const ChickenDuckScreen({super.key});

  @override
  State<ChickenDuckScreen> createState() => _ChickenDuckScreenState();
}

class _ChickenDuckScreenState extends State<ChickenDuckScreen> {
  final List<String> items = [
    'লেয়ার (ডিম)',
    'ব্রয়লার (মাংস)',
    'দেশি মুরগি',
    'সোনালী',
    'কোয়েল (বটেই)',
    'হাঁস',
    'টার্কি',
    'কবুতর',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("হাঁস মুরগি"),
        centerTitle: true,
        backgroundColor: Color(0xFFF59E0B),
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
                  color: isSelected ? Color(0xFFF59E0B) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFFF59E0B) : Colors.grey,
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
