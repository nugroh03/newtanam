import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/bantuan_page.dart';
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
  bool _blockvisible = false;
  bool _notifterkirim = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _block() {
    return Visibility(
      visible: _blockvisible,
      child: InkWell(
          onTap: () {
            this.setState(() {
              _blockvisible = false;
            });
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(0, 0, 0, 0.70),
              child: Text(""))),
    );
  }

  Widget menuhomepage() {
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
            IconButton(icon: FaIcon(FontAwesomeIcons.search), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BantuanPage()));
                }),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[green1, green2])),
          ),
          bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: white,
              tabs: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Order',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Keranjang',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Lacak',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
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

  Widget notif() {
    return Visibility(
      visible: _notifterkirim,
      child: Center(
        child: Container(
          color: white,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Order Terkirim',
                    style: GoogleFonts.poppins(
                        color: grey2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                  'Terima kasih anda sudah melakukan pemesanan kepada kami. Pesanan anda akan segera kami proses',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: grey,
                    fontSize: 16,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset('assets/orderterkirim.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: menuhomepage()),
          Positioned(child: _block()),
          Positioned(child: notif())
        ],
      ),
    );
  }
}
