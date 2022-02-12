import 'package:equatable/equatable.dart';
import 'package:flutter_interview/data/users_model.dart';

abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingUsersState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadedUsersState extends HomeState {
  UsersModel data;
  LoadedUsersState(this.data);
  @override
  List<Object?> get props => [];
}
