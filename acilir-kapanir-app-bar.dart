import 'package:flutter/material.dart';

class AcilirKapanirAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Açılır Kapanır App Bar'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.deepOrangeAccent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index) => ListTile(
                  title: Text('Öğe $index'),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
