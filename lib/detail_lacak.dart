import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:tanamio/hexColor.dart';
import 'package:tanamio/home_page.dart';
import 'package:tanamio/keranjang_page.dart';
import 'package:tanamio/lacak_page.dart';
import 'package:tanamio/order_page.dart';
import 'package:tanamio/tagihan_page.dart';

class DetailLacak extends StatefulWidget {
  DetailLacak({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailLacakState createState() => _DetailLacakState();
}

class _DetailLacakState extends State<DetailLacak> {
  int jmlproduk = 0;
  bool _blockvisible = false;

  void _incrementCounter() {
    setState(() {});
  }

  Widget _block() {
    return Visibility(
      visible: _blockvisible,
      child: InkWell(
          onTap: () {
            this.setState(() {});
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(0, 0, 0, 0.70),
              child: Text(""))),
    );
  }

  Widget title() {
    return Container(
      alignment: Alignment.center,
      height: 30,
      padding: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text('Kode Orderan',
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget tracking() {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Text('14 April 2020',
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/circle on.png'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Open PO',
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          // Accepted
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('',
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/circle off.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Accepted',
                          style: GoogleFonts.poppins(
                              color: grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Packing
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('',
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/circle off.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Packing',
                          style: GoogleFonts.poppins(
                              color: grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pick Up
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('',
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/circle off.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Pick Up',
                          style: GoogleFonts.poppins(
                              color: grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Drop Out
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('',
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/circle off.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Drop Out',
                          style: GoogleFonts.poppins(
                              color: grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {}),
              SizedBox(width: 10),
              Text('PESANAN', style: GoogleFonts.poppins(fontSize: 30)),
              SizedBox(width: 10),
              Text('ANDA',
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
      body: Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
                top: 50,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/Line1.png',
                    fit: BoxFit.contain,
                  ),
                )),
            Positioned(top: 35, child: title()),
            Positioned(top: 100, left: 20, child: tracking()),
            Positioned(
                bottom: 10,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: InkWell(
                      onTap: () {}, child: Image.asset('assets/hubungi.png')),
                ))
          ]),
      // bottomSheet: BottomAppBar(
      //     child: Container(
      //   alignment: Alignment.centerRight,
      //   height: MediaQuery.of(context).size.height * 0.2,
      //   child: Image.asset('assets/hubungi.png'),
      // )),
    );
  }
}
