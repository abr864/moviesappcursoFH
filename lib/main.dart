import 'package:flutter/material.dart';
import 'package:movapp/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'screeens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => Homescreen(),
        'details': (_) => Detailscreen(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
        color: Colors.blueGrey,
        centerTitle: true,
      )),
    );
  }
}
