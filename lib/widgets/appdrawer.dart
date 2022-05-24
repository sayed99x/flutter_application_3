// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../Providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            // de elly m4 ht5ly 3lamt el drawer tzhr tany lw 3mltha false 
            automaticallyImplyLeading: false,
          ),
          // dh by3ml 7aga zy horzontal line keda
          Divider(color: Colors.black, height: 20,),
          // ListTile(
          //   leading: Icon(Icons.shop),
          //   title: Text('Shop'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/');
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Orders'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/orders');
          //   },

          // ),
          //  Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Manage Products'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed(UserProduct.routename);
          //   },
            
          // ),
          //  Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LogOut'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).Logout();
            },
            
          )
        ],
      ),
    );
  }
}
