// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination()
  ..id = json['id'] as String
  ..guide = json['guide'] as String
  ..type = json['type'] as String
  ..activityLevel = json['activityLevel'] as String
  ..review = (json['review'] as List<dynamic>)
      .map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList()
  ..description = json['description'] as String
  ..benefits = json['benefits'] as String
  ..photo = json['photo'] as String
  ..price = json['price'] as int
  ..rating = json['rating'] as int;

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guide': instance.guide,
      'type': instance.type,
      'activityLevel': instance.activityLevel,
      'review': instance.review,
      'description': instance.description,
      'benefits': instance.benefits,
      'photo': instance.photo,
      'price': instance.price,
      'rating': instance.rating,
    };
