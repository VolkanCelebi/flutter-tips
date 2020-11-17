import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kurs_3/asycnMain.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AsyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: AsyncHomePage1(),
    );
  }
}

class AsyncHomePage1 extends StatefulWidget {
  @override
  _AsyncHomePageState1 createState() => _AsyncHomePageState1();
}

class _AsyncHomePageState1 extends State<AsyncHomePage1> {
  String veri1 ="";
  String veri2 ="";
  String veri3 ="";
    void veriGetir() async{
      String adi = await Future.delayed(Duration(seconds: 4),(){
        //setState(() {
          return 'Volkan Çelebi';
        //});
      });

      String meslek = await Future.delayed(Duration(seconds: 3),(){
        //setState(() {
          return 'Software Developer';
        //});
      });
      
      setState(() {
        //veri2 = 'Değer 2';
        veri2 = '$adi - $meslek';
      });

  }

  @override
  void initState() {
    super.initState();
    veriGetir();
    setState(() {
      veri2 = 'Değer 1';
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AsyncMain()),
            );
          },
        ),

        title: Text("Asenkron Veri Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Gelen Veri:', style: TextStyle(fontSize: 20, color: Colors.red),),
            SizedBox(height: 20),
            Text('$veri1', style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Text('$veri2', style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Text('$veri3', style: TextStyle(fontSize: 30, color: Colors.purple, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

