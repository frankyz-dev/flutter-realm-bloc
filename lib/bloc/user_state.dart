part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersLoadInProgress extends UserState {}

class UsersLoadSuccess extends UserState {
  final List<User> users;

  const UsersLoadSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UsersLoadFailure extends UserState {}
