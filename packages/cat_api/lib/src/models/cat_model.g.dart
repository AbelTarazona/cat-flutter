// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['life_span'] as String?,
      adaptability: json['adaptability'] as int?,
      intelligence: json['intelligence'] as int?,
      referenceImageId: json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'adaptability': instance.adaptability,
      'intelligence': instance.intelligence,
      'reference_image_id': instance.referenceImageId,
    };
