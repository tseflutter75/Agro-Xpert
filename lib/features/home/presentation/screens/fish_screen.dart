import 'package:flutter/material.dart';

class FishScreen extends StatefulWidget {
  const FishScreen({super.key});

  @override
  State<FishScreen> createState() => _FishScreenState();
}

class _FishScreenState extends State<FishScreen> {
  final List<String> items = [
    'রুই',
    'কাতলা',
    'মৃগেল',
    'তেলাপিয়া',
    'পাঙ্গাশ',
    'সিলভার কার্প',
    'গ্রাস কার্প',
    'চিংড়ি',
    'ইলিশ',
    'শিং',
    'মাগুর',
    'অন্যান্য',
  ];

  List<String> images = [
    "assets/images/motso/rui.png",
    "assets/images/motso/katla.png",
    "assets/images/motso/mrigel.png",
    "assets/images/motso/telapiya.png",
    "assets/images/motso/pangas.png",
    "assets/images/motso/silvarcrap.png",
    "assets/images/motso/grasscrap.png",
    "assets/images/motso/chinri.png",
    "assets/images/motso/ilish.png",
    "assets/images/motso/sing.png",
    "assets/images/motso/magur.png",
    "assets/images/motso/magur.png",
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("মৎস্য"),
        centerTitle: true,
        backgroundColor: Color(0xFF0EA5E9),
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
                  color: isSelected ? Color(0xFF0EA5E9) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF0EA5E9) : Color(0xFF0EA5E9),
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
