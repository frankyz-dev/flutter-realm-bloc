import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterrealm/bloc/user_repository.dart';
import 'package:flutterrealm/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UsersLoadInProgress()) {
    on<LoadUsers>((event, emit) async {
      emit(UsersLoadInProgress());
      try {
        final users = await userRepository.getUsers();
        emit(UsersLoadSuccess(users));
      } catch (_) {
        emit(UsersLoadFailure());
      }
    });

    on<AddUser>((event, emit) async {
      try {
        await userRepository.addUser(event.user);
        final users = await userRepository.getUsers();
        emit(UsersLoadSuccess(users));
      } catch (_) {
        emit(UsersLoadFailure());
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        await userRepository.deleteUser(event.id);
        final users = await userRepository.getUsers();
        emit(UsersLoadSuccess(users));
      } catch (_) {
        emit(UsersLoadFailure());
      }
    });
  }
}

