import 'package:flutter/material.dart';

import '../screens/ScreenPrincipal.dart';

AppBarPrincipal({required String nom}){
  return AppBar(
    title : Column(
      children: [
        Text('Hello,${nom}',style: TextStyle(fontSize: 14),),
        Text('Welcome,From Dschang,Cameroun',style: TextStyle(fontSize: 14),)
      ],
    ),
    actions: [
      CircleAvatar(
        backgroundImage: AssetImage(''),
      )
    ],
  );
}

Widget DrawerLayout(user, context){
  return Drawer(
      child: Material(
        color: Colors.teal[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            user != null
                ? userAccountHeader(user, user)
                : userAccountHeader('name', 'email@gmail.com'),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectItem(context, 0)),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () => selectItem(context, 1)),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.white,
            ),
            /* MenuList(
              text: 'Message',
              icon: Icons.messenger,
              onClicked: () => selectItem(context, 2)),
          const SizedBox(
            height: 5,
          ), */
            MenuList(
                text: 'Liste des utilisateurs',
                icon: Icons.list,
                onClicked: () => selectItem(context, 3)),
            /*  const SizedBox(
            height: 5,
          ),
          MenuList(
              text: 'Subscription',
              icon: Icons.person_add,
              onClicked: () => selectItem(context, 4)),
          const SizedBox(
            height: 5,
          ), */
            /* MenuList(
              text: 'Bookmarks',
              icon: Icons.bookmark,
              onClicked: () => selectItem(context, 5)),
          const SizedBox(
            height: 5,
          ), */
            const Divider(
              color: Colors.white,
            ),
            /* MenuList(
              text: 'Notification',
              icon: Icons.notifications,
              onClicked: () => selectItem(context, 6)),
          const SizedBox(
            height: 5,
          ), */
            MenuList(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectItem(context, 7)),
            const SizedBox(
              height: 5,
            ),
            user == null
                ? MenuList(
                text: 'Login',
                icon: Icons.login,
                onClicked: () => selectItem(context, 8))
                : MenuList(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectItem(context, 9)),
          ],
        ),
      ));
}

Widget userAccountHeader(name, email) => Container(
  color: Colors.teal[900],
  width: double.infinity,
  height: 200,
  padding: const EdgeInsets.only(top: 20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/sport2.jpg'),
          ),
        ),
      ),
      Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Text(
        email,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 14,
        ),
      ),
    ],
  ),
);

Widget MenuList(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  const color = Colors.white;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    onTap: onClicked,
  );
}

selectItem(BuildContext context, index) async {
  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScreenPrincipal(),
        ),
      );
      break;
  }
}