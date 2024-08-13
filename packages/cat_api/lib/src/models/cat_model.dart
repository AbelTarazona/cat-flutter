import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

/// {@template catModel}
/// A model containing data about a cat.
/// {@endtemplate}
@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CatModel extends Equatable {
  /// {@macro rocket}
  CatModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.referenceImageId,
  });

  final String? id;
  final String? name;
  final String? origin;
  final String? description;
  final String? lifeSpan;
  final int? adaptability;
  final int? intelligence;
  final String? referenceImageId;

  @override
  List<Object?> get props => [id, name, origin, description, lifeSpan, adaptability,
    intelligence, referenceImageId];

  /// Converts a JSON [Map] into a [CatModel] instance.
  static CatModel fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  /// Converts this [CatModel] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$CatModelToJson(this);

}
