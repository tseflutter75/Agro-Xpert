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

  List<String> images = [
    "assets/images/sobji/alu.jpg",
    "assets/images/sobji/tomatoo.jpg",
    "assets/images/sobji/begun.jpg",
    "assets/images/sobji/mula.jpg",
    "assets/images/sobji/lau.jpg",
    "assets/images/sobji/kumra.jpg",
    "assets/images/sobji/shim.jpg",
    "assets/images/sobji/peyaj.jpg",
    "assets/images/sobji/rosun.jpg",
    "assets/images/sobji/morich.jpg",
    "assets/images/sobji/dheros.jpg",
    "assets/images/sobji/palongsak.jpg",
    "assets/images/sobji/lalsak.png",
    "assets/images/sobji/puisak.jpg",
    "assets/images/sobji/korla.jpg",
    "assets/images/sobji/jhinge.png",
    "assets/images/sobji/cicinga.jpg",
    "assets/images/sobji/alu.jpg",
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
                  color: isSelected ? Color(0xFF65A30D) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF65A30D) : Color(0xFF65A30D),
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
