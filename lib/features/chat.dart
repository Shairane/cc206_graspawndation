import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
    children: [
      CircleAvatar( // Account icon
        backgroundColor: Colors.blue,
        child: Text('S'),
      ),
      SizedBox(width: 8.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dr. Vilma Teodora',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0, 
              //fontStyle: 'Arial', 
            ),
          ),
          Text(
            'Online', 
            style: TextStyle(
              fontSize: 12.0, 
            ),
          ),
        ],
      ),
    ],
  ),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pushNamed(context, '/profile');
    },
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.call),
      onPressed: () {
       
      },
    ),
    IconButton(
      icon: const Icon(Icons.videocam),
      onPressed: () {
        
      },
    ),
  ],
       
          elevation: 50.0,
          shadowColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
      ),
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/bg2.jpg', 
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 171, 226),      
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 20.0, color: Colors.blueGrey ,
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
      
    );

    setState(() {
      _messages.add(message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            
            backgroundColor: Colors.blue,
            child: Text('U'),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Name', 
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
