import 'package:agroxpert/app/color.dart';
import 'package:flutter/material.dart';

class HarvestScreen extends StatefulWidget {
  const HarvestScreen({super.key});

  @override
  State<HarvestScreen> createState() => _HarvestScreenState();
}

class _HarvestScreenState extends State<HarvestScreen> {
  final List<String> items = [
    'সবজি',
    'ধান',
    'গম',
    'ভুট্টা',
    'যব',
    'সরিষা',
    'পাট',
    'আখ',
    'মসুর',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ফসল"), centerTitle: true),
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
                              ? Colors
                                    .green // Change to AppColor.primaryGreen if defined
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
