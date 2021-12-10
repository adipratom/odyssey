// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review()
  ..photo = json['photo'] as String
  ..review = json['review'] as String
  ..id = json['id'] as String
  ..type = json['rating'] as int;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'photo': instance.photo,
      'review': instance.review,
      'id': instance.id,
      'rating': instance.type,
    };
