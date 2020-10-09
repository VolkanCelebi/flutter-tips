import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Toast'),
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
          RaisedButton(
            child: Text('Toast Mesajını Göster'),
            onPressed: (){
              Fluttertoast.showToast(msg: 'Toast Mesajımız',
                backgroundColor: Colors.red,
                textColor: Colors.yellowAccent,
                fontSize: 16.0,
                gravity: ToastGravity.CENTER,
                toastLength: Toast.LENGTH_LONG
              );
            },
          ),
          RaisedButton(
            child: Text('Custom Toast Mesajını Göster'),
            onPressed: (){
             var fToast = FToast();
             fToast.init(context);
             fToast.showToast(
               child: Container(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 24.0,
                   vertical: 12.0
                 ),
                 decoration: BoxDecoration(
                   color: Colors.greenAccent,
                   borderRadius: BorderRadius.circular(25.0),
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Icon(Icons.check),
                     SizedBox(width: 12.0),
                     Text('Bu custom Widget Mesajıdır!')
                   ],
                 ),
               ),
             );
            },
          ),
        ],
      ),
    );
  }
}
