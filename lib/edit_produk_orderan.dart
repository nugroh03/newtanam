import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:tanamio/keranjang_page.dart';
import 'package:tanamio/lacak_page.dart';
import 'package:tanamio/order_page.dart';
import 'package:tanamio/tagihan_page.dart';

class EditProductOrderan extends StatefulWidget {
  EditProductOrderan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EditProductOrderanState createState() => _EditProductOrderanState();
}

class _EditProductOrderanState extends State<EditProductOrderan> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('EDIT',
                  style: GoogleFonts.poppins(
                      fontSize: 30)),
                      SizedBox(width: 10),
              Text('ORDER',
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[green1, green2])),
        ),
        
      ),
      body: Container(
        child: Column(
          children:[
            
            Container(
              child: Image.asset('assets/product/butternut.png'),),
              Text('Butternut',style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold)),
                  Container(
                    child: Row(
                      children:[
                        Text('Butternut',style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold)),
                        Container(
                          child: Row(
                            children: [
                              
                            ],
                            
                          )
                        )
                      ]
                    )
                  )
          ]
        ),
      )
    );
  }
}
