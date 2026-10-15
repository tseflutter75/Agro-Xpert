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
    "assets/images/fosol/sobji.png",
    "assets/images/fosol/dhan.png",
    "assets/images/fosol/gom.png",
    "assets/images/fosol/vutta.png",
    "assets/images/fosol/job.png",
    "assets/images/fosol/sorisa.png",
    "assets/images/fosol/pat.png",
    "assets/images/fosol/akh.png",
    "assets/images/fosol/mosur.png",
  ];

  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ফসল"),
        centerTitle: true,
        backgroundColor: Color(0xFF12B981),
      ),
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
                  color: isSelected ? Color(0xFF12B981) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF12B981) : Color(0xFF12B981),
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
