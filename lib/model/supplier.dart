import 'package:better_uuid/uuid.dart';

class Supplier {
  Uuid id;
  String name;
  String address;
  String email;
  String website;
  String category;
  bool isChecked;

  Supplier(
      this.id,
      this.name,
      this.address,
      this.email,
      this.website,
      this.category,
      this.isChecked,
      );
}