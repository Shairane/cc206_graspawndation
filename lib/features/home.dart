import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';

//final Logger _logger = Logger();
class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("GRAS.PAWndation",
        style: TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.pinkAccent, 
        ),),  
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/main.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo2.png',
                width: 150,
                height: 150,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Adopt a life and get a friend!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 160, 5, 147),
                      ),
                    ),
                    SizedBox(height: 8.0), 
                   Center(
                    child: Text(
                      'Find your perfect companion among our adorable pets. '
                      'They are waiting for a loving home!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20, width: 60),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                child: const Text('Get Started', style: TextStyle(
      color: Color.fromARGB(255, 160, 8, 89),
      fontSize: 18.0,
      fontWeight: FontWeight.bold,),
                
              ),
            
          ),
            ]
        ),
      ),
      )
    );
  }
}
    
    
  

