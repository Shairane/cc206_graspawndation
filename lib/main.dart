import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animal Profile'),
          leading: const Icon(
            Icons.menu,
          ),
          elevation: 50.0,
          shadowColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          actions: <Widget>[
            IconButton(icon:const Icon(Icons.search), onPressed: () => {},
            iconSize: 30.0,
 ),
        
          ],
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Adopt Your Favorite One!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 16, 85, 119),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            ),
            AnimalSearchBar(),
            Expanded(
              child: AnimalProfileGrid(),
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
            icon: Icon(Icons.add_location_alt_rounded),
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

class AnimalSearchBar extends StatefulWidget {
  const AnimalSearchBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimalSearchBarState createState() => _AnimalSearchBarState();
}

class _AnimalSearchBarState extends State<AnimalSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          // Add your logic to filter profiles based on the search query
          // For now, let's print the query to the console
          if (kDebugMode) {
            print('Search Query: $query');
          }
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class AnimalProfileGrid extends StatelessWidget {
  const AnimalProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: animalProfiles.length,
      itemBuilder: (context, index) {
        return AnimalProfileCard(animalProfile: animalProfiles[index]);
      },
    );
  }
}

class AnimalProfileCard extends StatelessWidget {
  final AnimalProfile animalProfile;

  const AnimalProfileCard({super.key, required this.animalProfile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              animalProfile.imageUrl,
              height: 300.0,
              width: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                animalProfile.name,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Text(
                animalProfile.description,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalProfile {
  final String name;
  final String description;
  final String imageUrl;

  AnimalProfile({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

// Sample animal profiles
List<AnimalProfile> animalProfiles = [
  AnimalProfile(
      name: 'Kitty',
      description: '3 months old \nLocation: Delgado Animal Dey Care & Rescue Center',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbml1-eIUUYwuqKb9Fsl6yBE26sIrYOoNV5w&usqp=CAU'),
  AnimalProfile(
      name: 'Mocha',
      description: '2 years old \nLocation: Iloilo City Pound and Animal Shelter',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRVq6mRRjn2a7auju8TDKVnsBaMH040W6n1B9o04IqgmYM6SILRI6no0ChV-8BqkY6VDY&usqp=CAU'),
  AnimalProfile(
      name: 'Staire',
      description: '9 months old \nLocation: Lambunao Animal Shelter',
      imageUrl: 'https://i0.wp.com/thediscerningcat.com/wp-content/uploads/2021/11/tabby-cat-about-to-sneeze.jpg?resize=533%2C800&ssl=1'),
  AnimalProfile(
      name: 'Berry',
      description: '6 months old \nLocation: Pet Headquarters Animal Clinic-Pet HQ',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0NsseirRK3mGyQyuLWKSwLDRJ7aIFRSyw6A&usqp=CAU'),
  AnimalProfile(
      name: 'Milo',
      description: '4 years old \nLocation: Animal Shelter Veterinary Clinic',
      imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/large-cat-breed-1553197454.jpg'),
  AnimalProfile(
      name: 'Luigi John Dayot a.k.a Luwi',
      description: '5 months old \nLocation: Ilonggo Vets Animal Clinic',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoHXBaMSa1JrolLnhYIcEGgXDML0DYlNM0NoBnJnA-xHf6nUv3o80xgYGDp-E_TaUGQyI&usqp=CAU'),
  // Add more AnimalProfile objects for other animals
];



