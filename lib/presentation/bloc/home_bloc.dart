import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/data/home_repositor_impl.dart';
import 'package:flutter_interview/presentation/bloc/home_event.dart';
import 'package:flutter_interview/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = HomeRepositoryImpl();
  HomeBloc() : super(InitialHomeState()) {
    on<GetUsers>(((event, emit) async {
      emit(LoadingUsersState());
      final request = await repository.getUsers(event.query);
      emit(LoadedUsersState(request));
    }));
  }
}
