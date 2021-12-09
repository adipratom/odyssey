// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideModel _$GuideModelFromJson(Map<String, dynamic> json) => GuideModel(
      guideName: json['guideName'] as String,
      description: json['description'] as String,
      contact: json['contact'] as String,
      isVerified: json['isVerified'] as bool,
    );

Map<String, dynamic> _$GuideModelToJson(GuideModel instance) =>
    <String, dynamic>{
      'guideName': instance.guideName,
      'description': instance.description,
      'contact': instance.contact,
      'isVerified': instance.isVerified,
    };
