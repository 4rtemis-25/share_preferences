import 'package:flutter/material.dart';
import 'package:share_preferences/sharedPreferences/preferences.dart';
import 'package:share_preferences/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('DarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Género: ${Preferences.gender}'),
          const Divider(),
          Text('Nombre De Usuario: ${Preferences.name}'),
          const Divider(),
        ],
      )
    );
  }
}