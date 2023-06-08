import 'package:realm/realm.dart';

@RealmModel() // define a data model class named `_Car`.
class _Car {
  late String make;

  late String model;

  int? kilometers = 500;
}