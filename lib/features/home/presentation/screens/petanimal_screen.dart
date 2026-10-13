import 'package:agroxpert/app/color.dart';
import 'package:flutter/material.dart';

class PetAnimalScreen extends StatefulWidget {
  const PetAnimalScreen({super.key});

  @override
  State<PetAnimalScreen> createState() => _PetAnimalScreenState();
}

class _PetAnimalScreenState extends State<PetAnimalScreen> {
  final List<String> items = [
    'গরু – দুগ্ধ',
    'গরু – গরুমোটা',
    'ছাগল – দেশি',
    'ছাগল – হাইব্রিড',
    'মহিষ',
    'ভেড়া',
    'খরগোশ',
  ];

  // Removed selectedItemCheckColor since we check it dynamically per item
  final List<String> selectedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("পশু"),
        centerTitle: true,
        backgroundColor: Color(0xFF8B5CF6),
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
                  color: isSelected ? Color(0xFF8B5CF6) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFF8B5CF6) : Colors.grey,
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
