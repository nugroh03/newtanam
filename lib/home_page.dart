import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:tanamio/keranjang_page.dart';
import 'package:tanamio/lacak_page.dart';
import 'package:tanamio/order_page.dart';
import 'package:tanamio/tagihan_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.only(top: 10),
            child: Text('tanam.io',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(icon:FaIcon(FontAwesomeIcons.search), onPressed: (){}),
            IconButton(icon:Icon(Icons.menu), onPressed: (){}),

          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[green1, green2])),
          ),
          bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Container(
                  child: Text(
                    'Order',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Keranjang',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Lacak',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Tagihan',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                )
              ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            OrderPage(),
            KeranjangPage(),
            LacakPage(),
            TagihanPage(),
          ],
        ),
      ),
    );
  }
}
