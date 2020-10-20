//animator: ^2.0.1
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animator/animator.dart';

class Animator1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Animator'),
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
  final animatorKey = AnimatorKey<double>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Animator(
            tweenMap: {
              "ilk": Tween<double>(begin: 0, end: 1),
              "ikinci": Tween<double>(begin: 1, end: 0),
            },
            builder: (context, state, child){
              return FractionalTranslation(
                translation: Offset(state.getAnimation("ikinci").value, 0),
                child: Transform.scale(child: child, scale: state.getAnimation("ilk").value,),
              );
            },
            child: RaisedButton(
              onPressed: () {
                animatorKey.controller.reverse();
                animatorKey.refreshAnimation(
                  tween: Tween<double>(begin: 0.5, end:1),
                  curve: Curves.easeInOut,
                );
                animatorKey.triggerAnimation();
              },
              child: Text(
                'Giriş İçin Tıklayınız',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.lightGreen,
              textColor: Colors.white,
              padding: EdgeInsets.all(20.0),
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            height: 150.0,
            color: Colors.red,
            child: Animator(
              animatorKey: animatorKey,
              triggerOnInit: true,
              builder: (context,state,child){
                return Opacity(
                  opacity: state.value,
                  child: child,
                );
              },
              tween: Tween<double>(begin: 0, end: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Giriş Bilgileri',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.save),
                              SizedBox(width: 12.0),
                              Text('Kayıt Ol', style: TextStyle(color: Colors.white),)
                            ],
                          ),
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.lock_open),
                              SizedBox(width: 12.0),
                              Text('Giriş Yap')
                            ],
                          ),
                          color: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
