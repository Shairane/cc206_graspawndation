import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();
class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PetCare Hub'),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _logger.d('Menu Bar icon clicked!');
                //print('Menu Bar icon clicked');
              },
            ),
            //IconButton(
              //icon: const Icon(Icons.chat),
             // onPressed: () {
              //  _logger.d('Chatbot icon clicked');
                
                //print('Chatbot icon clicked');
             // },
           // ),
            IconButton(
  icon: const Icon(Icons.home),
  onPressed: () {
    _logger.d('Home icon clicked');
    Navigator.pushNamed(context, '/profile');
  },
),

          ],
        ),
        body: Stack(
          children: [
            
            Image.asset(
              'images/bg4.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            TabBarView(
              children: [
                
                ListView(
                  children: const [
                   Padding(
                      padding: EdgeInsets.all(16.0),
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
                
                const Center(child: Text('Chats content')),
                
                ListView(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
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
                
                const Center(child: Text('Profile content')),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(   
          unselectedItemColor: Colors.black38,     
          unselectedFontSize: 14.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedIconTheme: const IconThemeData(color: Colors.black, size: 18.0) , 
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          selectedFontSize: 16.0,
          selectedIconTheme: const IconThemeData(color: Color.fromARGB(96, 24, 4, 116), size: 20.0),
          selectedItemColor: Colors.blue,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          onTap: (index){
            if (index == 0){
              Navigator.pushNamed(context, '/profile');
            }else if (index == 1){
              Navigator.pushNamed(context, '/chat');
            }else if (index == 2){
                Navigator.pushNamed(context, '/service');
               }else if (index == 3){
                Navigator.pushNamed(context, '/user');
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
          ]
        ),
      ),
    );
  
            } 
               }

class FeatureGridView extends StatelessWidget {
  const FeatureGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        FeatureWidget(
          imageUrl:
              'https://st4.depositphotos.com/2885805/27865/v/600/depositphotos_278658570-stock-illustration-family-animal-shelter-composition.jpg',
          buttonText: 'Find Shelters Near You',
          onPressed: () {
            _logger.d('Find shelters button clicked');
            //print('Find Shelters button clicked');
          },
        ),
        FeatureWidget(
          imageUrl:
              'https://media.istockphoto.com/id/1161880635/vector/veterinarian-and-doctor-with-dog-and-cat-on-counter-in-vet-clinic.jpg?s=612x612&w=0&k=20&c=ES3XWKYOHW-3yFAWxAUE8KUPucugdKxnsL6kamqi7fw=',
          buttonText: 'Find Veterinary Clinics Near You',
          onPressed: () {
            _logger.d('Find Veterinary Clinics button clicked');
            //print('Find Veterinary Clinics button clicked');
          },
        ),
        FeatureWidget(
          imageUrl:
              'https://st.depositphotos.com/1177973/1271/i/600/depositphotos_12714440-stock-photo-grooming-the-yorkshire-terrier-isolated.jpg',
          buttonText: 'Find Grooming Centers Near You',
          onPressed: () {
            _logger.d('Find Grooming Centers button clicked');
            //print('Find Grooming Centers button clicked');
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

  const FeatureWidget({super.key, 
    required this.imageUrl,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
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
              const SizedBox(height: 10.0),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}