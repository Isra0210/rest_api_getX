import 'package:flutter/material.dart';

class DrawerWidet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black38),
            accountEmail: Text('Israel@gmail.com'),
            accountName: Text('Israel Rodrigues'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: NetworkImage(
                'https://scontent.fpgz2-1.fna.fbcdn.net/v/t1.0-9/44025494_256986168341711_6406099118195736576_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=YgCW-1KBmlcAX8IgcII&_nc_ht=scontent.fpgz2-1.fna&oh=7e31bc2785be8a4b3b50aa12e37d6210&oe=606E354C',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
