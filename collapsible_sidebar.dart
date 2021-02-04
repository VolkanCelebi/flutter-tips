import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

//dependencies:
//   collapsible_sidebar: ^1.0.7+2
class CollapsibleDemo extends StatefulWidget {
  @override
  _CollapsibleDemoState createState() => _CollapsibleDemoState();
}

class _CollapsibleDemoState extends State<CollapsibleDemo> {
  List<CollapsibleItem> _items;
  String _headline;
  NetworkImage _avatarImage =
      NetworkImage('https://avatars.githubusercontent.com/u/68637222');

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'Panel',
          icon: Icons.assessment,
          onPressed: () => setState(() => _headline = 'Panel'),
          isSelected: true),
      CollapsibleItem(
          text: 'Hatalar',
          icon: Icons.cancel,
          onPressed: () => setState(() => _headline = 'Hatalar')),
      CollapsibleItem(
          text: 'Arama',
          icon: Icons.search,
          onPressed: () => setState(() => _headline = 'Arama')),
      CollapsibleItem(
          text: 'Deneme',
          icon: Icons.add_location,
          onPressed: () => setState(() => _headline = 'Deneme')),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((element) => element.isSelected).text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CollapsibleSidebar(
          items: _items,
          avatarImg: _avatarImage,
          title: 'Katlanabilir Deneme',
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueGrey[50],
            child: Center(
              child: Text(
                _headline,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          backgroundColor: Colors.indigo,
          selectedTextColor: Colors.limeAccent,
          textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          //liste öğeleri
          titleStyle: TextStyle(
              //liste başlığı
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          toggleTitleStyle:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          toggleTitle: 'Kapat',
          toggleButtonIcon: Icons.arrow_right_alt_rounded,
        ),
      ),
    );
  }

}
