import 'package:agroxpert/features/home/presentation/screens/homescreen.dart';
import 'package:agroxpert/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavControllerScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNavControllerScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavControllerScreen> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavControllerScreen> {
  late int selected;

  final List<Widget> _pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),

    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AnimatedSwitcher for smooth transitions
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _pages[selected],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200, // Border color
              width: 1, // Border thickness
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.white,
            indicatorColor: Colors.white.withOpacity(0.2),

            // 🔸 Label text color customization
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                );
              }
              return const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: selected,
            elevation: 10,
            onDestinationSelected: (value) {
              setState(() => selected = value);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: 'Demo',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                selectedIcon: Icon(Icons.shopping_bag_rounded),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: Icon(Icons.location_on_outlined),
                selectedIcon: Icon(Icons.location_on_rounded),
                label: 'Visit',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
              // NavigationDestination(
              //   icon: Image.asset(
              //     "assets/images/logo.png",

              //     height: 30,
              //     width: 30,
              //   ),
              //   label: "Home",
              // ),
              // NavigationDestination(
              //   icon: Image.asset(
              //     "assets/images/logo.png",

              //     height: 30,
              //     width: 30,
              //   ),
              //   label: "Demo",
              // ),

              // NavigationDestination(
              //   icon: Image.asset(
              //     "assets/images/logo.png",
              //     height: 30,
              //     width: 30,
              //   ),
              //   label: "Shop",
              // ),

              // NavigationDestination(
              //   icon: Image.asset(
              //     "assets/images/logo.png",

              //     height: 30,
              //     width: 30,
              //   ),
              //   label: "Visit",
              // ),
              // NavigationDestination(
              //   icon: Image.asset(
              //     "assets/images/logo.png",

              //     height: 30,
              //     width: 30,
              //   ),

              //   label: "Profile",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
