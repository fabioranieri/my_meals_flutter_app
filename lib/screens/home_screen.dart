import 'package:flutter/material.dart';
import 'package:easy_quote_flutter_app/screens/login_screen.dart';
import 'package:easy_quote_flutter_app/model/supplier.dart';
import 'package:easy_quote_flutter_app/widget/supplier_card_list_item.dart';

class HomeScreen extends StatefulWidget {
  final List<Supplier> items;

  const HomeScreen({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('[HomeScreen Widget] createState()');
    return _HomeScreenState(items: this.items);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Supplier> items;
  _HomeScreenState({Key key, @required this.items});

  @override
  void initState() {
    print('[_HomeScreenState] initState');
    super.initState();
  }

  void _addProduct(Supplier item) {
    setState(() {
      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyQuote App'),
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.lightBlueAccent[300],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Side menu clicked");
            },
          )
        ],
      ),
      //body: _buildList(items),
      body: SupplierCardListItem(items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var now = new DateTime.now();
          Supplier item = Supplier(
            "Carlos H." + now.toString(),
            "Av. São Vicente de Paula, 473",
            "carlos@quicktech.no",
            "twitter.com",
            "Software"
          );
          this._addProduct(item);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        elevation: 7,
      ),
    );
  }
}