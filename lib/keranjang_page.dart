import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';

class KeranjangPage extends StatefulWidget {
  KeranjangPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool _keranjangkosong = true;

  List dataorderan = [
    /*{
      'nameproduct': 'Butternut',
      'hargasatuan': '5.000',
      'qty': '100',
      'hargatotal': '500.000'
    },
    {
      'nameproduct': 'Melon',
      'hargasatuan': '4.000',
      'qty': '50',
      'hargatotal': '200.000'
    },
    {
      'nameproduct': 'Cabai',
      'hargasatuan': '20.000',
      'qty': '5',
      'hargatotal': '100.000'
    },
    {
      'nameproduct': 'Kentang',
      'hargasatuan': '10.000',
      'qty': '5',
      'hargatotal': '50.000'
    },*/
  ];

  void _incrementCounter() {
    setState(() {});
  }

  Widget keranjangkosong() {
    return Visibility(
      visible: _keranjangkosong,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 120,
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/keranjang.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Keranjang Anda Kosong',
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

  Widget orderan(item) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
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
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/product/butternut.png'),
                )),
            Flexible(
                flex: 3,
                child: Container(
                  color: white,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['nameproduct'],
                                      style: GoogleFonts.poppins(fontSize: 17)),
                                  Text('Rp.' + '' + item['hargasatuan'] + '/Kg',
                                      style: GoogleFonts.poppins(
                                          color: grey, fontSize: 14)),
                                ],
                              ),
                            ),
                            IconButton(
                                iconSize: 25,
                                color: grey,
                                alignment: Alignment.topCenter,
                                icon: FaIcon(
                                  FontAwesomeIcons.trashAlt,
                                ),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        child: Text('Rp.' + '  ' + item['hargatotal'],
                            style: GoogleFonts.poppins(
                                color: red,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Qty' + '  ' + item['qty'] + '  ' + 'Kg',
                                style: GoogleFonts.poppins(fontSize: 15)),
                            InkWell(
                              onTap: () {},
                              child: Text('Edit Order',
                                  style: GoogleFonts.poppins(
                                      color: blue, fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget listproduct() {
    return ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: dataorderan.length > 0
            ? dataorderan
                .map<Widget>(
                  (item) => orderan(item),
                )
                .toList()
            : [keranjangkosong()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [listproduct()],
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                color: green2,
                child: Text('Total: Rp. 500.000',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
              ),
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    color: green1,
                    child: Text('Kirim Order',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 20)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
