import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(Container(
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'My Eid Shopping List',
              style: TextStyle(color: Colors.deepPurple), // Set color to purple
            ),
          ),
          backgroundColor: Color(0xFFD0A5B1), // Tea Pink color
        ),
        body: ShoppingList(),
      ),
    ),
  ));
}

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> with TickerProviderStateMixin {
  final List<String> items = [
    'Handbag',
    'Earrings',
    'Necklace',
    'Bracelet',
    'Watch',
    'Ring',
    'Belt',
    'Wallet',
    'Sunglasses',
    'Hat',
    'Scarf',
    'Tie',
    'Gloves',
    'Hairband',
    'Shoes'
  ];
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.deepOrange,
    Colors.lightBlue,
  ];

  final List<IconData> icons = [
    Icons.wallet_travel,
    Icons.earbuds,
    Icons.emoji_events,
    Icons.change_history,
    Icons.watch,
    Icons.ring_volume,
    Icons.bed_rounded,
    Icons.account_balance_wallet,
    Icons.gamepad,
    Icons.hail,
    Icons.face,
    Icons.emoji_objects,
    Icons.handshake,
    Icons.headset,
    Icons.sports_tennis,
  ];

  int? _selectedRadio;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('${items[index]} clicked');
          },
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 5),
            child: Container(
              color: colors[index],
              child: ListTile(
                leading: Icon(icons[index], color: colors[(index + 5) % 15]),
                title: Text(
                  items[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: index,
                      groupValue: _selectedRadio,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedRadio = value;
                        });
                      },
                    ),
                    SizedBox(
                      child: BackgroundFetchClickEvent(
                        onPressed: () {},
                        child: Icon(Icons.delete, color: colors[(index + 15) % 15]),
                        color: colors[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

BackgroundFetchClickEvent({required Null Function() onPressed, required Icon child, required Color color}) {
}
