

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
      ),
      child: ListView(
        children: <Widget>[

          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Graphify Example'),
          ),

          ListTile(
            title: const Text('Basic Line Chart'),
            onTap: () {
              context.go('/basic-line');
            },
          ),


        ],
      ),
    );
  }


}
