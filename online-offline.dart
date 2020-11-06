//connectivity_widget: ^0.1.7
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_widget/connectivity_widget.dart';

class OnlineOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConnectivityUtils.initialize(
      serverToPing: "google.com",
      callback: (response) => response.contains("Bu testtir"),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Online Offline'),
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
  int _basariliSay = 0;
  int _basarisizSay = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ConnectivityWidget(
        onlineCallback: _basariliArtir,
        offlineCallback: _basarisizArtir,
        builder: (context, isOnline)=>Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${isOnline ? 'Çevrimiçi': 'Çevrimdışı'}",
              style: TextStyle(fontSize: 30, color: isOnline ? Colors.green : Colors.red),
              ),
              SizedBox(height: 20),
              Text('Başarılı bağlantı sayısı:'),
              Text('$_basariliSay', style: Theme.of(context).textTheme.headline4,),
              SizedBox(height: 20),
              Text('Başarısız bağlantı sayısı:'),
              Text('$_basarisizSay', style: Theme.of(context).textTheme.headline4,),
            ],
          ),
        ),
      ),
    );
  }



  void _basariliArtir() {
    setState(() {
      _basariliSay++;
    });
  }
  void _basarisizArtir() {
    setState(() {
      _basarisizSay++;
    });
  }
}
