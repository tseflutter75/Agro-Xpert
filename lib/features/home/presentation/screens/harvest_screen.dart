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

  List<String> images = [
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
    "assets/images/harvest.png",
  ];

  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ফসল"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // প
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedItemList.contains(
                    items[index],
                  );

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedItemList.remove(items[index]);
                        } else {
                          selectedItemList.add(items[index]);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.green : Colors.grey,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(images[index], height: 30, width: 30),

                          Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
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
