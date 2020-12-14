import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tanamio/detail_lacak.dart';

class LacakPage extends StatefulWidget {
  LacakPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LacakPageState createState() => _LacakPageState();
}

class _LacakPageState extends State<LacakPage> {
  int _counter = 0;

  List orderanlacak = [
    {'codeorderan': 'AASSBB788000', 'tanggal_orderan': '11 Desember 2020'},
    {'codeorderan': 'AASSBB788010', 'tanggal_orderan': '13 Desember 2020'},
    {'codeorderan': 'AASSBB789888', 'tanggal_orderan': '12 Desember 2020'},
    {'codeorderan': 'AASSBB787653', 'tanggal_orderan': '16 Desember 2020'}
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget lacakkosong() {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
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
    );
  }

  Widget lacak(item) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailLacak()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            color: white,
            border: Border(left: BorderSide(width: 5, color: green2)),
            // borderRadius: BorderRadius.only(
            //     topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                flex: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['codeorderan']),
                      Text(item['tanggal_orderan'])
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: IconButton(
                      icon: Icon(Icons.forward, color: green2),
                      onPressed: () {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listorderan() {
    return ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: orderanlacak.length > 0
            ? orderanlacak
                .map<Widget>(
                  (item) => lacak(item),
                )
                .toList()
            : [lacakkosong()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primary, body: listorderan());
  }
}
