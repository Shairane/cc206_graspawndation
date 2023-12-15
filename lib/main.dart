import 'package:flutter/material.dart';
import 'package:project/features/home.dart';
import 'package:project/features/pet_profile.dart';  
import 'package:project/features/service.dart';
import 'package:project/features/chat.dart';
import 'package:project/features/user.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrasPAWandation',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) => const Home(),
        '/profile': (BuildContext ctx) => const PetProfile(),
        '/service': (BuildContext ctx) => const Services(),   
        '/chat': (BuildContext ctx) => const ChatScreen(),
        '/user': (BuildContext ctx) => const User(),   
        },      
    );
  }
}




