import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    //throw UnimplementedError();
    return Drawer(
      child: ListView(
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('JOHN DOE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            accountEmail: Text('johndoe@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.allprodad.com/wp-content/uploads/2021/03/05-12-21-happy-people.jpg'),
            ),
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.add_chart_rounded),
            title: Text('Session'),
          ),
          ListTile(
            leading: Icon(Icons.vpn_key_rounded),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
