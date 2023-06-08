import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrealm/bloc/user_bloc.dart';
import 'package:flutterrealm/bloc/user_repository.dart';
import 'package:flutterrealm/components/add_user_form.dart';
import 'package:flutterrealm/components/user_table.dart';
import 'package:realm/realm.dart' as realm;

void main() {
  runApp(UserManagementApp());
}

class UserManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management App',
      home: Scaffold(
        appBar: AppBar(title: const Text('User Management')),
        body: BlocProvider(
          create: (context) => UserBloc(UserRepository())..add(LoadUsers()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Save can be found at: " + realm.Configuration.defaultStoragePath),
                Text("Save can be found at: " + realm.Configuration.defaultRealmPath),
                Expanded(child: UserTable()),
                AddUserForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
