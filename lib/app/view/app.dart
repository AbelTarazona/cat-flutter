import 'package:cat_flutter/app/view/app_view.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.catRepository});

  final CatRepository catRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: catRepository,
      child: const AppView(),
    );
  }
}
