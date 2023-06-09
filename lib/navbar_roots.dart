import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navpages/schedule_page.dart';
import 'navpages/todo_page.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({Key? key}) : super(key: key);

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 1;
  final _screens = [
    Container(),
    SchedulePage(),
    TodoPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark_fill), label: "Schedule"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: "Todo"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ],

        ),
      ),
    );
  }
}
