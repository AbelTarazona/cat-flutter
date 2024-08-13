import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._catRepository) : super(const HomeState()) {
    on<CatInformationFetched>(_onCatInformationFetched);
  }

  final CatRepository _catRepository;

  FutureOr<void> _onCatInformationFetched(
    CatInformationFetched event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final cats = await _catRepository.fetchAllCats();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          cats: cats,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<String> getImage(String reference) async {
    return _catRepository.fetchImageCat(reference);
  }
}
