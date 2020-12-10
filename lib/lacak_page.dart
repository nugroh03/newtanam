import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';

class LacakPage extends StatefulWidget {
  LacakPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LacakPageState createState() => _LacakPageState();
}

class _LacakPageState extends State<LacakPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
    );
  }
}
