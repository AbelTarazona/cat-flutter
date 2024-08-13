import 'package:cat_flutter/home/bloc/home_bloc.dart';
import 'package:cat_flutter/home/view/home_view.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(context.read<CatRepository>())
        ..add(const CatInformationFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catbreeds'),
          centerTitle: true,
        ),
        body: const HomeView(),
      ),
    );
  }
}
