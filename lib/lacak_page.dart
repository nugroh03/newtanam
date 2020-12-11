import 'package:auto_size_text/auto_size_text.dart';
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
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/lacak.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Tidak Ada Daftar Lacak',
                      style: GoogleFonts.poppins(
                          color: grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Text(
                    'Silahkan Anda melakukan Order dengan memilih produk yang ada',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: grey,
                      fontSize: 16,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: FlatButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[green1, green2])),
                        child: AutoSizeText(
                          'Mulai Order',
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
