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
    "assets/images/hasmurgi/leyar.jpg",
    "assets/images/hasmurgi/broiler.jpg",
    "assets/images/hasmurgi/desimurgi.jpg",
    "assets/images/hasmurgi/sonali.jpg",
    "assets/images/hasmurgi/koyel.jpg",
    "assets/images/hasmurgi/has.jpg",
    "assets/images/hasmurgi/tarki.jpg",
    "assets/images/hasmurgi/kobutor.jpg",
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



// Given an integer array arr, return all the unique pairs [arr[i], 
// arr[j]] such that i != j and arr[i] + arr[j] == 0.

// Note: The pairs must be returned in sorted order,
//  the solution array should also be sorted, and the answer must
//   not contain any duplicate pairs.

// Examples:

// Input: arr = [-1, 0, 1, 2, -1, -4]
// Output: [[-1, 1]]
// Explanation: arr[0] + arr[2] = (-1)+ 1 = 0.
// arr[2] + arr[4] = 1 + (-1) = 0.
// The distinct pair are [-1,1].
// Input: arr = [6, 1, 8, 0, 4, -9, -1, -10, -6, -5]
// Output: [[-6, 6],[-1, 1]]
// Explanation: The distinct pairs are [-1, 1] and [-6, 6].