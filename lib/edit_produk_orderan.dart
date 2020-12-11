import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:tanamio/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('EDIT', style: GoogleFonts.poppins(fontSize: 30)),
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 130),
        child: Container(
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
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Container(
              height: height * 0.4,
              child: Image.asset('assets/product/butternut.png'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Butternut',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text('Rp' + ' ' + '5000' + 'Kg',
                      style: GoogleFonts.poppins(fontSize: 20, color: grey)),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: grey3,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              width: width,
                              child: IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 15,
                                    color: grey2,
                                  ),
                                  onPressed: () {})),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            child: Text(jmlproduk.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: grey2)),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              width: width,
                              child: IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 15,
                                    color: grey2,
                                  ),
                                  onPressed: () {})),
                        )
                      ],
                    ),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:',
                        style: GoogleFonts.poppins(fontSize: 20, color: grey)),
                    Text(
                      'Rp.' + ' ' + '1.000.000',
                      style: GoogleFonts.poppins(fontSize: 20, color: red),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  color: green2,
                  child: Text('Batal',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20)),
                ),
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
                    child: Text('Simpan',
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
