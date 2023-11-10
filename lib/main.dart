import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_preferences/provider/theme_provider.dart';
import 'package:share_preferences/screens/home_screen.dart';
import 'package:share_preferences/screens/settings_screen.dart';
import 'package:share_preferences/sharedPreferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp((
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode),)
      ],
      child: const MyApp(),
    )
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Share Preferences',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}