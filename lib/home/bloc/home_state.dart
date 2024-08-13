part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;

  bool get isSuccess => this == HomeStatus.success;

  bool get isError => this == HomeStatus.error;

  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  const HomeState({this.cats = const [], this.status = HomeStatus.initial});

  final List<Cat> cats;
  final HomeStatus status;

  @override
  List<Object?> get props => [cats, status];

  HomeState copyWith({
    List<Cat>? cats,
    HomeStatus? status,
  }) {
    return HomeState(
      cats: cats ?? this.cats,
      status: status ?? this.status,
    );
  }
}
