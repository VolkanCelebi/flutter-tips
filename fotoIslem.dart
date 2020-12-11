/*
Gerekli Dosyalar
pubsec.yaml içine:

  image_picker: ^0.6.7+15
  image_cropper: ^1.3.1

AndroidManifest.xml içine:
        <activity
            android:name="com.yalantis.ucrop.UCropActivity"
            android:screenOrientation="portrait"
            android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
*/

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FotoIslem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FotoIslemHome();
  }
}

class FotoIslemHome extends StatefulWidget {
  @override
  _FotoIslemHomeState createState() => _FotoIslemHomeState();
}

class _FotoIslemHomeState extends State<FotoIslemHome> {
  File _secilenDosya;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil İşlemleri"),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: CircleAvatar(
              child: _secilenDosya == null ? Text("Fotoğraf") : null,
              radius: 80,
              backgroundImage:
                  _secilenDosya != null ? FileImage(_secilenDosya) : null,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Fotoğraf Yükle"),
            onPressed: () {
              _secimFotoGoster(context);
            },
          ),
        ],
      ),
    );
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Galeriden Fotoğraf Seç"),
              onTap: () {
                _secimYukle(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Kameradan Fotoğraf Çek"),
              onTap: () {
                _secimYukle(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    final secilen = await picker.getImage(source: source);
    setState(() {
      if (secilen != null) {
        //_secilenDosya = File(secilen.path);
        _fotografKes(File(secilen.path));
      }
    });
    Navigator.pop(context);
  }

  void _fotografKes(File photo) async {
    File kesilenFoto = await ImageCropper.cropImage(
      sourcePath: photo.path,
      //aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      maxWidth: 800,
    );

    if (kesilenFoto != null) {
      setState(() {
        _secilenDosya = kesilenFoto;
      });
    }
  }
}
