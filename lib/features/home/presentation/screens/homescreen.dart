import 'package:agroxpert/app/color.dart';
import 'package:agroxpert/features/home/presentation/screens/chicken_duck_screen.dart';
import 'package:agroxpert/features/home/presentation/screens/egg_screen.dart';
import 'package:agroxpert/features/home/presentation/screens/fish_screen.dart';
import 'package:agroxpert/features/home/presentation/screens/harvest_screen.dart';
import 'package:agroxpert/features/home/presentation/screens/petanimal_screen.dart';
import 'package:agroxpert/features/home/presentation/screens/vegetables_screen.dart';
import 'package:agroxpert/features/home/presentation/widgets/action_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF172554),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Agro Xpert'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFF17B978),
              child: const Text(
                'Al',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle(),
              const SizedBox(height: 12),

              // Quick Actions
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: [
                  ActionCard(
                    title: 'ফসল',
                    image: "assets/images/harvest.png",
                    colors: const [Color(0xFF12B981), Color(0xFF15803D)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HarvestScreen(),
                        ),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'সবজি',
                    image: "assets/images/vegetables.png",
                    colors: const [Color(0xFF65A30D), Color(0xFF15803D)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VegetableScreen(),
                        ),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'হাঁস মুরগি',
                    image: "assets/images/chicken.png",
                    colors: const [Color(0xFFF59E0B), Color(0xFFEA580C)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChickenDuckScreen(),
                        ),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'ডিম',
                    image: "assets/images/egg.png",
                    colors: const [Color(0xFFF97316), Color(0xFFDC2626)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EggScreen()),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'মৎস্য',
                    image: "assets/images/fish.png",
                    colors: const [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FishScreen()),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'পশু',
                    image: "assets/images/cow.png",
                    colors: const [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetAnimalScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section Heading
  Text sectionTitle() {
    return Text(
      "কৃষির ধরন",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF64748B),
        letterSpacing: 0.4,
      ),
    );
  }
}
