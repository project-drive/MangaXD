import 'package:flutter/material.dart';
class MangaXD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:  Scaffold(
        body: MangaList(),
      )      
    );
  }
}