import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waka_app/screens/auth/login_screen.dart';

class NavBase extends StatefulWidget {
  const NavBase({Key? key}) : super(key: key);

  @override
  State<NavBase> createState() => _NavBaseState();
}

class _NavBaseState extends State<NavBase> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LoginScreen(),
    LoginScreen(),
    LoginScreen(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.mediumImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavBar = [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_rounded),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add Report",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add Report",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add Report",
      )
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 5,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          items: bottomNavBar,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
