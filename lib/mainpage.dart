import 'package:flutter/material.dart';
import 'package:grocerystoreapp/cart_page.dart';
import 'package:grocerystoreapp/market.dart';
import 'package:grocerystoreapp/loguout.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.username});

  final String username;


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Market(),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // New function to handle logout button press
  void _onLogoutPressed() {
    // Navigate to the LogoutPage and pass the username
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LogoutPage(username: widget.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Marketplace',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[700],
            ),
          ),
          centerTitle: false,
          actions: [
            MaterialButton(
                // onPressed: () {
                  // Navigator.pop(context);
                // },
                onPressed: _onLogoutPressed,
                child: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 35,
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ], currentIndex: _selectedIndex, onTap: _onItemTapped),
        body: _widgetOptions[_selectedIndex]);
  }
}
