import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AdoptionApp(),
  ));
}

class AdoptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PetCare Hub'),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('Menu Bar icon clicked');
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                print('Chatbot icon clicked');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            // Background Image
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/023/809/604/original/seamless-pattern-cat-faces-and-paw-prints-on-a-white-background-print-background-children-s-textile-wallpaper-vector.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            TabBarView(
              children: [
                // Home Tab
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:
                              'Search for shelters, clinics, or grooming centers',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    FeatureGridView(),
                  ],
                ),
                // Chats Tab
                Center(child: Text('Chats content')),
                // Services Tab
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for services',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    FeatureGridView(),
                  ],
                ),
                // Profile Tab
                Center(child: Text('Profile content')),
              ],
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'Chats',
            ),
            Tab(
              icon: Icon(Icons.room_service),
              text: 'Services',
            ),
            Tab(
              icon: Icon(Icons.account_circle),
              text: 'Profile',
            ),
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
        ),
      ),
    );
  }
}

class FeatureGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        FeatureWidget(
          imageUrl:
              'https://st4.depositphotos.com/2885805/27865/v/600/depositphotos_278658570-stock-illustration-family-animal-shelter-composition.jpg',
          buttonText: 'Find Shelters Near You',
          onPressed: () {
            print('Find Shelters button clicked');
          },
        ),
        FeatureWidget(
          imageUrl:
              'https://media.istockphoto.com/id/1161880635/vector/veterinarian-and-doctor-with-dog-and-cat-on-counter-in-vet-clinic.jpg?s=612x612&w=0&k=20&c=ES3XWKYOHW-3yFAWxAUE8KUPucugdKxnsL6kamqi7fw=',
          buttonText: 'Find Veterinary Clinics Near You',
          onPressed: () {
            print('Find Veterinary Clinics button clicked');
          },
        ),
        FeatureWidget(
          imageUrl:
              'https://st.depositphotos.com/1177973/1271/i/600/depositphotos_12714440-stock-photo-grooming-the-yorkshire-terrier-isolated.jpg',
          buttonText: 'Find Grooming Centers Near You',
          onPressed: () {
            print('Find Grooming Centers button clicked');
          },
        ),
      ],
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final String imageUrl;
  final String buttonText;
  final VoidCallback onPressed;

  FeatureWidget({
    required this.imageUrl,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 10 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
