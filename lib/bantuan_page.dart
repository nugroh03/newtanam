import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:tanamio/home_page.dart';
import 'package:tanamio/keranjang_page.dart';
import 'package:tanamio/lacak_page.dart';
import 'package:tanamio/order_page.dart';
import 'package:tanamio/tagihan_page.dart';

class BantuanPage extends StatefulWidget {
  BantuanPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BantuanPageState createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
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

  Widget menubantuan(icon, title, onpress) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            color: white,
            border: Border(left: BorderSide(width: 5, color: green2)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: icon),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Text(title,
                          style: GoogleFonts.poppins(fontSize: 17)))),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(
                    Icons.forward,
                    color: green2,
                  ),
                ),
              )
            ],
          ),
        ),
        onPressed: onpress,
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
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () {}),
                SizedBox(width: 10),
                Text('PUSAT', style: GoogleFonts.poppins(fontSize: 30)),
                SizedBox(width: 10),
                Text('BANTUAN',
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
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              menubantuan(
                  Icon(
                    Icons.people,
                    color: green2,
                  ),
                  'Atur Profil',
                  () {}),
              menubantuan(
                  Icon(
                    Icons.vpn_key,
                    color: green2,
                  ),
                  'Password',
                  () {}),
              menubantuan(
                  Icon(
                    Icons.mail,
                    color: green2,
                  ),
                  'Hubungi Kami',
                  () {}),
              menubantuan(
                  Icon(
                    Icons.note,
                    color: green2,
                  ),
                  'Syarat dan Ketentuan',
                  () {}),
              menubantuan(
                  Icon(
                    Icons.privacy_tip,
                    color: green2,
                  ),
                  'Kebijakan Privasi',
                  () {}),
              menubantuan(
                  Icon(
                    Icons.logout,
                    color: green2,
                  ),
                  'Keluar',
                  () {}),
            ])));
  }
}
