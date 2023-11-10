import 'package:flutter/material.dart';
import 'package:share_preferences/sharedPreferences/preferences.dart';
import 'package:share_preferences/widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkMode,
                    title: const Text('DarkMode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.gender,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.gender,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  child: TextFormField(
                    initialValue: 'Fernando',
                    onChanged: ( value ) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre Del Usuario'
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
