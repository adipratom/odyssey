// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      description: json['description'] as String,
      profilePicture: json['profilePicture'] as String,
      headerPicture: json['headerPicture'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      id: json['id'] as String,
      isGuide: json['isGuide'] as bool,
      guideDetails: json['guideDetails'] == null
          ? null
          : GuideModel.fromJson(json['guideDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'profilePicture': instance.profilePicture,
      'headerPicture': instance.headerPicture,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'isGuide': instance.isGuide,
      'id': instance.id,
      'guideDetails': instance.guideDetails,
    };
