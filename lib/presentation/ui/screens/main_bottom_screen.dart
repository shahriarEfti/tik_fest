import 'package:flutter/material.dart';
import 'package:tik_fest/presentation/ui/screens/favourite_screen.dart';
import 'package:tik_fest/presentation/ui/screens/home_screen.dart';
import 'package:tik_fest/presentation/ui/screens/profile_screen.dart';
import 'package:tik_fest/presentation/ui/screens/ticket_screen.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  int _selectedIndex =0;

  final List<Widget> _screens= [
    HomeScreen(),
    TicketScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (index){

          setState(() {
            _selectedIndex=index;

          });
        },
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.redAccent,
          items: [


        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_add),label: 'Ticket'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
      ]),

    );
  }
}
