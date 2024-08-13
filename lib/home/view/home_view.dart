import 'package:cat_flutter/home/bloc/home_bloc.dart';
import 'package:cat_flutter/home/widgets/cat_card.dart';
import 'package:cat_flutter/utils/extensions/sizebox.dart';
import 'package:cat_flutter/utils/extensions/snackbar.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_listview/searchable_listview.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status.isError) {
          context.showSnackBar(message: 'Ocurrió un error');
        }
      },
      buildWhen: (previous, current) =>
          current.status.isSuccess || current.status.isLoading,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              24.0.heightBox,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchableList<Cat>(
                    initialList: state.cats,
                    itemBuilder: (cat) => CatCard(cat: cat),
                    filter: (value) => state.cats
                        .where(
                          (element) => element.name.toLowerCase().contains(value),
                        ).toList(),
                    emptyWidget: const Text('No cats'),
                    inputDecoration: InputDecoration(
                      labelText: 'Search cat breed',
                      isDense: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
