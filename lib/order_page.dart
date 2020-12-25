import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamio/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'config.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key, this.title, this.nextpage}) : super(key: key);

  final String title;
  final Function nextpage;

  @override
  _OrderPageState createState() => _OrderPageState(nextpage: nextpage);
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  _OrderPageState({Key key, this.nextpage});

  Function nextpage;

  int _counter = 0;

  int jmlorderpro = 0;

  List dataProduct = [];

  Map keranjang = {};
  List qty = [];

  @override
  void initState() {
    super.initState();
    getProduct('');
  }
  // void _incrementCounter() {
  //   setState(() {

  //   });
  // }

  void getProduct(item) async {
    print('akses api');

    final data = {
      'search': item.toString(),
    };
    var url = Uri.http(apiurlget, '/product', data);
    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var responses = Responses(jsonResponse);

      if (responses.success == "true") {
        print('product: ' + json.encode(responses.data));

        setState(() {
          dataProduct = json.decode(responses.data);
        });
      } else {
        _alert('Gagal', 'Silahkan Coba Lagi!');
      }
    } else {
      //print('Request failed with status: ${response.statusCode}.');
      _alert('Gagal', 'Silahkan Coba Lagi');
    }
  }

  Future<void> _alert(title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget gridkategori(item) {
    var index = dataProduct.indexOf(item);

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
                    child: Image.network(
                      item['image'],
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(item['name_product']),
                Text('Rp.' + item['price_product'].toString() + '/Kg'),
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
                        onPressed: () {
                          if (dataProduct[index] != null) {
                            var qty = dataProduct[index]['qty'];
                            if (qty >= 1) {
                              qty--;

                              dataProduct[index]['qty'] = qty;

                              setState(() {
                                dataProduct[index] = dataProduct[index];
                                keranjang = keranjang;
                              });
                              print(keranjang.toString());
                            }
                          }
                        }),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(dataProduct[index]['qty'].toString(),
                        /*qty[index]*/
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
                            onPressed: () {
                              if (dataProduct[index] != null) {
                                var qty = dataProduct[index]['qty'];
                                var id = dataProduct[index]['product_id'];
                                var data = dataProduct[index];
                                qty++;
                                if (keranjang[id] != null) {
                                  keranjang[id]['qty'] = qty;
                                } else {
                                  keranjang[id] = data;
                                }

                                dataProduct[index]['qty'] = qty;

                                setState(() {
                                  dataProduct[index] = dataProduct[index];
                                  keranjang = keranjang;
                                });
                                print(keranjang.toString());
                              }
                            }))),
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
        padding: const EdgeInsets.only(top: 10, bottom: 50, left: 5, right: 5),
        child: GridView.count(
          childAspectRatio: 4 / 5,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          children:
              dataProduct.map<Widget>((item) => gridkategori(item)).toList(),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              final SharedPreferences prefs1 =
                  await SharedPreferences.getInstance();
              prefs1.setString('keranjang', json.encode(keranjang));

              print(keranjang);

              //nextpage();
            },
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

class Responses {
  String success;
  String message;
  String data;
  Responses(Map<String, dynamic> item) {
    success = item['success'];
    message = item['message'];
    data = item['data'];
  }
}
