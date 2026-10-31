import 'package:flutter/material.dart';

import 'Pages/home_page.dart';
import 'Pages/initial_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isUserLoggedIn = false;
  runApp(MyApp(isLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'LocalEye',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: isLoggedIn ? '/' : '/initial' ,
      routes: {
        '/': (context) => InitialPage(),
        '/home' :(context) => HomePage(),
      },
    );
    return app;
  }
}
