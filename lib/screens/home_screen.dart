import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/login_screen.dart';
import 'package:my_meals_flutter_app/screens/meal_details_screen.dart';
import 'package:my_meals_flutter_app/widget/meal_card_list_item.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:provider/provider.dart';

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
    super.initState();
  }

  void _updateDetails(int position) {
    final _meallist = Provider.of<MealList>(context);
    Meal meal = _meallist.meallist[position];
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _meallist = Provider.of<MealList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meals App'),
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Side menu clicked");
            },
          )
        ],
      ),
      body: MealCardListItem(_meallist.meallist, _updateDetails),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MealDetailsScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        elevation: 7,
      ),
    );
  }
}