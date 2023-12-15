import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage(
              'images/bg3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage(
                          'images/prof1.jpg',
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shaira Olido',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          IconButton(
                            icon: const Icon(Icons.message),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chat');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Lower Portion
              const Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileDetail(label: 'Username', value: 'Shaira Pretty'),
                      UserProfileDetail(
                          label: 'Email', value: 'prettyn@example.com'),
                      UserProfileDetail(
                          label: 'Mobile Number', value: '09048270882'),
                      UserProfileDetail(
                          label: 'Date of Birth', value: '07/20/2002'),
                      UserProfileDetail(
                          label: 'Location', value: 'Calinog, Iloilo'),
                      UserProfileDetail(label: 'Sex', value: 'Female'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  // Handle edit button press
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        unselectedFontSize: 14.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: const IconThemeData(color: Colors.black, size: 18.0),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        selectedFontSize: 16.0,
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(96, 24, 4, 116), size: 20.0),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/profile');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/service');
          } else if (index == 3) {
            // Navigator.pushNamed(context, '/user');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class UserProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const UserProfileDetail({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
