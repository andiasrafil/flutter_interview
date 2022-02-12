import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class GetUsers extends HomeEvent {
  final String query;
  GetUsers(this.query);
  @override
  List<Object?> get props => [];
}
