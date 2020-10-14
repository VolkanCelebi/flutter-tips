//pubsec.yaml dosyasına
//dependencies:
  //flutter_auth_buttons: ^0.10.0
  
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
class AuthButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Auth Buttons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          //AuthButtons start
          GoogleSignInButton(
            darkMode: true,
            onPressed: (){},
            text: 'Google ile giriş yap',
            borderRadius: 10.0,
            splashColor: Colors.purple,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          TwitterSignInButton(
            onPressed: (){},
            centered: true,

          ),
          FacebookSignInButton(
            onPressed: (){},

          ),
          MicrosoftSignInButton(
            onPressed: (){},
            darkMode: true,
          ),
          AppleSignInButton(
            onPressed: (){},

          ),
          //AuthButtons end
        ],
      ),
    );
  }
}
