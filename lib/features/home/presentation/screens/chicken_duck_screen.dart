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

  List<String> images = [
    "assets/images/hasmurgi/leyar.png",
    "assets/images/hasmurgi/broiler.png",
    "assets/images/hasmurgi/desimurgi.png",
    "assets/images/hasmurgi/sonali.png",
    "assets/images/hasmurgi/koyel.png",
    "assets/images/hasmurgi/has.png",
    "assets/images/hasmurgi/tarki.png",
    "assets/images/hasmurgi/kobutor.png",
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
            childAspectRatio: 1.2,
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
                    color: isSelected ? Color(0xFFF59E0B) : Color(0xFFF59E0B),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(images[index], height: 45, width: 45),
                    Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
