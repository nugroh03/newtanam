import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';

class KeranjangPage extends StatefulWidget {
  KeranjangPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      /*body: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 16 / 7,
        crossAxisCount: 3,
        children: _daftarproduct
            .map<Widget>(
              (item) => Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: grey2, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(item),
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            )
            .toList(),
      ),*/
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
