//Uygulamaya ait build number, appname, version, package name değerlerini almaya yarar
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

//Bu import için pubsec.yaml dosyasında
//dependencies: bölümünün hemen altına
  //package_info: ^0.4.3 kütüphanesini eklemeyi unutmayın.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Package Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Dersleri'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Package Info Değerleri: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.deepOrangeAccent),
            ),
            const Divider(
              color: Colors.deepOrangeAccent,
              height: 20,
              thickness: 2,
              endIndent: 0,
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot){
                if(snapshot.hasData)
                  return Column(
                    children: <Widget>[
                      Text(
                        'Uygulamanın İsmi: ' + snapshot.data.appName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        'Paket İsmi: ' + snapshot.data.packageName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        'Derleme No: ' + snapshot.data.buildNumber,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        'Sürüm No: ' + snapshot.data.version,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ],
                  );
                return Container();
              },
            ),
            Text(
              ' ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
