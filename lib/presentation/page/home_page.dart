import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/presentation/bloc/home_bloc.dart';
import 'package:flutter_interview/presentation/bloc/home_event.dart';
import 'package:flutter_interview/presentation/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // BlocProvider.of<HomeBloc>(context).add()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              BlocProvider.of<HomeBloc>(context).add(GetUsers(value));
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
            if (state is LoadedUsersState) {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.data.items?.length,
                    itemBuilder: (context, index) {
                      final data = state.data.items?[index];
                      return Text(data?.login ?? "");
                    }),
              );
            } else if (state is LoadingUsersState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          }))
        ],
      ),
    );
  }
}
