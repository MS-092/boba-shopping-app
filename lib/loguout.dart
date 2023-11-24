import 'package:flutter/material.dart';
import 'package:grocerystoreapp/login.dart';
import 'package:grocerystoreapp/mainpage.dart';
import 'package:grocerystoreapp/intro.dart';

class LogoutPage extends StatelessWidget {
  final String username;

  LogoutPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
        automaticallyImplyLeading: false, // This will add the back button to the AppBar
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainPage(username: '$username')));
                      } // Navigate back to the previous screen
          ,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'User Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Username: $username',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Dialog box for shopping list
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Terms of Service'),
                            content: Column(
                              children: [
                                Text('''Terms of Services
Welcome to Boba Shop App! By using our app, you agree to the following terms:
1. Use our app responsibly and in accordance with applicable laws.
2. We respect your privacy
3. Intellectual Property laws require you to have a copy of the privacy policy
4. Your Content is our Content
5. No Warranties
6. We may update our terms and conditions
Contact Us: If you have questions, contact us at *******.
Thanks for using Boba Shop App!
                                '''),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Terms of Service'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Dialog box for saved address
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('About/Version'),
                            content: Column(
                              children: [
                                Text("""About: Welcome to Boba Shop App, your go-to destination for a seamless shopping experience. Discover the latest trends, shop with ease, and enjoy secure transactions. Thank you for choosing us as your trusted shopping companion.

                              Version: X.X.X"""),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('About'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()), // Use the expanded container to push buttons to the bottom
          BottomAppBar(
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
                onPressed: () async {
                  // Confirmation dialog
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
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
