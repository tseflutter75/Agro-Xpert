import 'package:flutter/material.dart';

class VegetableScreen extends StatefulWidget {
  const VegetableScreen({super.key});

  @override
  State<VegetableScreen> createState() => _VegetableScreenState();
}

class _VegetableScreenState extends State<VegetableScreen> {
  final List<String> items = [
    'আলু',
    'টমেটো',
    'বেগুন',
    'মূলা',
    'লাউ',
    'কুমড়া',
    'শিম',
    'পেঁয়াজ',
    'রসুন',
    'মরিচ',
    'ঢেঁড়স',
    'পালং শাক',
    'লাল শাক',
    'পুঁই শাক',
    'করলা',
    'ঝিঙে',
    'চিচিঙ্গা',
    'অন্যান্য',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সবজি"),
        centerTitle: true,
        backgroundColor: Color(0xFF65A30D),
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
                  color: isSelected ? Color(0xFF65A30D) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF65A30D) : Colors.grey,
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
