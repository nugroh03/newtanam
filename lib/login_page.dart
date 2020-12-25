import 'package:flutter/material.dart';
import 'color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'config.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fieldphone = new TextEditingController();
  final fieldpin = new TextEditingController();
  @override
  void initState() {
    super.initState();
    fieldphone.text = '';
    fieldpin.text = '';
    checkUser();
  }

  void checkUser() async {
    final SharedPreferences prefs7 = await SharedPreferences.getInstance();
    var user = prefs7.getString('user');

    if (user != null && user != '') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void login() async {
    Map data = {'phone': fieldphone.text, 'pin': fieldpin.text};
    //encode Map to JSON
    var body = json.encode(data);
    var url = apiurl + 'login';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var responses = Responses(jsonResponse);

      if (responses.success == "true") {
        print('user: ' + json.encode(responses.data));

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', responses.data);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        EasyLoading.dismiss();
        _alert('Info', 'Login gagal!');
      }
    } else {
      EasyLoading.dismiss();
      //print('Request failed with status: ${response.statusCode}.');
      _alert('Info', 'Login gagal!');
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

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 150.0,
        child: Image.asset('assets/logo_io.png'),
      ),
    );

    final email = TextFormField(
      controller: fieldphone,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: green1, width: 3.0),
            borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: fieldpin,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: green2, width: 3),
            borderRadius: BorderRadius.circular(32.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: green1, width: 3.0),
            borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          login();
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [green1, green2])),
          child: Text('Login',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
        ));

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: GoogleFonts.poppins(color: blue, fontSize: 15),
      ),
      onPressed: () {},
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              forgotLabel,
              loginButton,
            ],
          ),
        ),
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
