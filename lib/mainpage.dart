import 'package:flutter/material.dart';
import 'package:grocerystoreapp/cart_page.dart';
import 'package:grocerystoreapp/intro.dart';
import 'package:grocerystoreapp/market.dart';

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

                 onPressed: () async{
                  // confirmation dialog
                  bool logoutConfirmed = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Do you really want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );

                  if (logoutConfirmed == true) {
                    // After successful logout, the user will be going to the login page
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => IntroScreen()),
                    );
                  }
                 },
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
