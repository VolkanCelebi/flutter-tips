import 'package:flutter/material.dart';
//pubsec.yaml --> reviews_slider: ^1.0.5
import 'package:reviews_slider/reviews_slider.dart';

class Degerlendirme extends StatefulWidget {
  Degerlendirme({Key key}) : super(key: key);

  @override
  _DegerlendirmeState createState() => _DegerlendirmeState();
}

class _DegerlendirmeState extends State<Degerlendirme> {
  int selectedValue1, selectedValue2, selectedValue3;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Değerlendirme Sayfası'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aldığınız hizmet nasıldı?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ReviewSlider(
                onChange: onChange1,
                optionStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                options: ['Korkunç', 'Kötü', 'Orta', 'İyi', 'Muhteşem'],
              ),
              Text(
                selectedValue1.toString(),
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              Text(
                'Ürünümüzün kalitesi?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ReviewSlider(
                onChange: onChange2,
                optionStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                options: ['Korkunç', 'Kötü', 'Orta', 'İyi', 'Muhteşem'],
              ),
              Text(
                selectedValue2.toString(),
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              Text(
                'Ürünümüzün fiyatı?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ReviewSlider(
                onChange: onChange3,
                optionStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                options: ['Korkunç', 'Kötü', 'Orta', 'İyi', 'Muhteşem'],
              ),
              Text(
                selectedValue3.toString(),
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onChange1(int index) {
    setState(() {
      selectedValue1 = index;
    });
  }

  void onChange2(int index) {
    setState(() {
      selectedValue2 = index;
    });
  }

  void onChange3(int index) {
    setState(() {
      selectedValue3 = index;
    });
  }
}
