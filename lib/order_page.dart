import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _counter = 0;
  int jmlorderpro = 0;

  final List<String> _product = [
    'assets/product/butternut.png',
    'assets/product/kol.png',
    'assets/product/melon.png',
    'assets/product/sawi.png',
    'assets/product/cabai.png',
    'assets/product/kentang.png',
    'assets/product/butternut.png',
    'assets/product/kol.png',
    'assets/product/melon.png',
    'assets/product/sawi.png',
    'assets/product/cabai.png',
    'assets/product/kentang.png',
  ];

  // void _incrementCounter() {
  //   setState(() {

  //   });
  // }

  Widget gridkategori(item) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                    color: white,
                    height: 80,
                    width: 100,
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('Nama Product'),
                Text('Rp. 5000, /Kg'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          size: 12,
                        ),
                        onPressed: () {}),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(jmlorderpro.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                        )),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.plus, size: 12),
                        onPressed: () {}),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 40, left: 5, right: 5),
        child: GridView.count(
          childAspectRatio: 4 / 5,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          children: _product.map<Widget>((item) => gridkategori(item)).toList(),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [green1, green2])),
              child: Text('ORDER',
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
            )),
      ),
    );
  }
}
