import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'GRAS.PAWndation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text(
              'Contacts',
              style: TextStyle(fontFamily: 'Lato'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  'https://t3.ftcdn.net/jpg/02/98/20/18/360_F_298201895_5bPjYW2qPWJ52Wg40H80d8hCAHsPIfpE.jpg'),
              fit: BoxFit.cover,
            ),
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              'Email: gras.pawndation@gmail.com',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontFamily: 'Lato',
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'Silkscreen'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fpng.pngtree.com%2Fbackground%2F20210715%2Foriginal%2Fpngtree-simple-pet-cat-paw-hand-drawn-background-picture-image_1282067.jpg&tbnid=jky8NeikzPcXKM&vet=12ahUKEwi24P7PxpCDAxXOamwGHdx2B2kQMygAegQIARBT..i&imgrefurl=https%3A%2F%2Fpngtree.com%2Ffree-backgrounds-photos%2Fpets&docid=vsXb8Yst65kEgM&w=1200&h=857&q=simple%20background%20images%20for%20pet%20website&ved=2ahUKEwi24P7PxpCDAxXOamwGHdx2B2kQMygAegQIARBT'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Settings',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Silkscreen',
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
