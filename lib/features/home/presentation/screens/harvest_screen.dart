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
    "assets/images/fosol/sobji.jpg",
    "assets/images/fosol/dhan.png",
    "assets/images/fosol/gom.jpg",
    "assets/images/fosol/vutta.jpg",
    "assets/images/fosol/job.jpg",
    "assets/images/fosol/sorisa.jpg",
    "assets/images/fosol/pat.jpg",
    "assets/images/fosol/akh.jpg",
    "assets/images/fosol/mosur.jpg",
  ];

  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ফসল"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // প
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
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.green,
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
