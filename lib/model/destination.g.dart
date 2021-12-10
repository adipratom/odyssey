// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      name: json['name'] as String,
      rating: json['rating'] as int,
      price: json['price'] as int,
      photo: json['photo'] as String,
      benefits: json['benefits'] as String,
      description: json['description'] as String,
      activityLevel: json['activityLevel'] as String,
      type: json['type'] as String,
      review: (json['review'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      guide: json['guide'] as String,
      id: json['id'] as String,
    );

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
      'name': instance.name,
    };
