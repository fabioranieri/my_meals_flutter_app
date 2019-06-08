import 'package:flutter/material.dart';
import 'package:easy_quote_flutter_app/model/supplier.dart';

class SupplierCardListItem extends StatelessWidget {
  final List<Supplier> items;
  SupplierCardListItem(this.items);

  @override
  Widget build(BuildContext context) {
    Widget cardItem = Container();

    if(items.length > 0) {
        cardItem = Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            if(item is Supplier){
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.address),
              );
            }
          },
        ),
      );
    } else {
      cardItem = Center(child: Text('No items found, please add some'));
    }
    return cardItem;
  }
}