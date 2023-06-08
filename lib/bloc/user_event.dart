part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUsers extends UserEvent {
  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final User user;

  const AddUser(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUser extends UserEvent {
  final String id;

  const DeleteUser(this.id);

  @override
  List<Object> get props => [id];
}
