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

  List datatagihan = [
    {
      'codeorderan': 'AASSBB788000',
      'tanggal_orderan': '11 Desember 2020',
      'quantity': '200',
      'pembayaran': 'Rp. 0',
      'blmlunas': 'Rp.1.000.000'
    },
    {
      'codeorderan': 'AASSBB788010',
      'tanggal_orderan': '13 Desember 2020',
      'quantity': '200',
      'pembayaran': 'Rp. 0',
      'blmlunas': 'Rp.1.000.000'
    },
    {
      'codeorderan': 'AASSBB789888',
      'tanggal_orderan': '12 Desember 2020',
      'quantity': '200',
      'pembayaran': 'Rp. 0',
      'blmlunas': 'Rp.1.000.000'
    },
    {
      'codeorderan': 'AASSBB787653',
      'tanggal_orderan': '16 Desember 2020',
      'quantity': '200',
      'pembayaran': 'Rp. 0',
      'blmlunas': 'Rp.1.000.000'
    }
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget tagihan(item) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
    );
  }

  Widget listtagihan() {
    return ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: datatagihan.length > 0
            ? datatagihan
                .map<Widget>(
                  (item) => tagihan(item),
                )
                .toList()
            : [tagihankosong()]);
  }

  Widget tagihankosong() {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primary, body: listtagihan());
  }
}
