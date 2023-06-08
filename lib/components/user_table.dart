import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrealm/bloc/user_bloc.dart';
import 'package:flutterrealm/models/user.dart';

class UserTable extends StatelessWidget {
  const UserTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UsersLoadSuccess) {
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Id'),
              ),
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Email'),
              ),
              DataColumn(
                label: Text('Delete'),
              ),
            ],
            rows: state.users.map((User user) => _buildDataRow(context, user)).toList(),
          );
        }
        // Add more states as needed.
        else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  DataRow _buildDataRow(BuildContext context, User user) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(user.id ?? '')),
        DataCell(Text(user.name ?? '')),
        DataCell(Text(user.email ?? '')),
        DataCell(IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<UserBloc>().add(DeleteUser(user.id));
          },
        )),
      ],
    );
  }
}
