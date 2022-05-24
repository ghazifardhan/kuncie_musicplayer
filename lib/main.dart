import 'package:flutter/material.dart';
import 'package:kuncie_musicplayer/modules/music/screens/music.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito'
      ),
      debugShowCheckedModeBanner: false,
      home: const MusicScreen(),
    );
  }
}
