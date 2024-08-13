import 'package:cat_api/cat_api.dart';
import 'package:cat_repository/src/models/cat.dart';

/// Thrown when an error occurs while looking up cats.
class CatsException implements Exception {}

/// {@template cat_repository}
/// API about cats
/// {@endtemplate}
class CatRepository {
  /// {@macro cat_repository}
  CatRepository({CatApi? catApi}) : _catApi = catApi ?? CatApi();

  final CatApi _catApi;

  /// Returns a list of all cats.
  ///
  /// Throws a [CatsException] if an error occurs.
  Future<List<Cat>> fetchAllCats() async {
    try {
      final cats = await _catApi.fetchAllCats();
      return cats.map((e) => e.toCat()).toList();
    } on Exception {
      throw CatsException();
    }
  }

  /// Returns a cat image.
  ///
  /// Throws a [CatsException] if an error occurs.
  Future<String> fetchImageCat(String reference) async {
    try {
      final catImage = await _catApi.fetchCatImage(reference);
      return catImage;
    } on Exception {
      throw CatsException();
    }
  }
}

extension on CatModel {
  Cat toCat() {
    return Cat(
      id: id ?? '',
      name: name ?? '',
      origin: origin ?? '',
      description: description ?? '',
      lifeSpan: lifeSpan ?? '',
      adaptability: adaptability ?? 0,
      intelligence: intelligence ?? 0,
      referenceImageId: referenceImageId ?? '',
    );
  }
}
