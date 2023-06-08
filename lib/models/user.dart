import 'package:realm/realm.dart';

part 'user.g.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class _User {
  @PrimaryKey()
  late String id;

  late String name;

  late String email;
}