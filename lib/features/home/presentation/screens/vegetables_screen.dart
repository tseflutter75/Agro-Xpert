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
                              ? Color(
                                  0xFF65A30D,
                                ) // Change to AppColor.primaryGreen if defined
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
