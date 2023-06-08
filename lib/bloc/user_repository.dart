import 'package:realm/realm.dart' as realm;
import 'package:flutterrealm/models/user.dart';


class UserRepository {
  final db = realm.Realm(realm.Configuration.local([User.schema]));

  Future<List<User>> getUsers() async {
    final users = db.all<User>().toList();
    return users;
  }

  Future<void> addUser(User user) async {
    await db.write(() async {
      db.add(user);
    });
  }

  Future<void> deleteUser(String id) async {
    await db.write(() async {
      final user = db.find<User>(id);
      if (user != null) {
        db.delete(user);
      }
    });
  }
}
