import 'package:equatable/equatable.dart';

/// {@template user}
/// An object which represents a specific cat.
/// {@endtemplate}
class Cat extends Equatable {
  /// {@macro rocket}
  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.referenceImageId,
    this.image = ''
  });

  final String id;
  final String name;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int intelligence;
  final String referenceImageId;
  String image;

  @override
  List<Object?> get props => [id, name, origin, description, lifeSpan, adaptability,
    intelligence, referenceImageId, image];
}
