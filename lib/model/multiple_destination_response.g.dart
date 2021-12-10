// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_destination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleDestinationResponse _$MultipleDestinationResponseFromJson(
        Map<String, dynamic> json) =>
    MultipleDestinationResponse()
      ..destination = (json['data'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MultipleDestinationResponseToJson(
        MultipleDestinationResponse instance) =>
    <String, dynamic>{
      'data': instance.destination,
    };
