import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/login_screen.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/widget/supplier_card_list_item.dart';
import 'package:better_uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> items;

  const HomeScreen({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('[HomeScreen Widget] createState()');
    return _HomeScreenState(items: this.items);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meal> items;
  _HomeScreenState({Key key, @required this.items});

  @override
  void initState() {
    print('[_HomeScreenState] initState');
    super.initState();
  }

  void _addMeal(Meal item) {
    setState(() {
      items.add(item);
    });
  }

  void _setMealchecked(int position, bool isChecked) {
    var suppliers = items;
    suppliers[position].isDone = isChecked == true ? false : true;
    setState(() {
      items = suppliers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meals App'),
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
      body: SupplierCardListItem(items, _setMealchecked),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var now = new DateTime.now();
          Meal item = Meal(
              Uuid.v4(),
              "Lunch - " + now.toString(),
              DateTime.now(),
              "Banana",
              "-",
              "Lunch",
              true
          );
          this._addMeal(item);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        elevation: 7,
      ),
    );
  }
}