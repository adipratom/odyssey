// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      description: json['description'] as String,
      profilePicture: json['profilePicture'] as String,
      headerPicture: json['headerPicture'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'profilePicture': instance.profilePicture,
      'headerPicture': instance.headerPicture,
      'name': instance.name,
      'id': instance.id,
    };