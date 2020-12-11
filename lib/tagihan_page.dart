import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';

class TagihanPage extends StatefulWidget {
  TagihanPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TagihanPageState createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/tagihan.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Anda tidak memiliki tagihan',
                      style: GoogleFonts.poppins(
                          color: grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Text('Terimakasih Anda sudah tidak menangguhkan pembayaran',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: grey,
                      fontSize: 16,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
