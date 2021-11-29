// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_destination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleDestinationResponse _$SingleDestinationResponseFromJson(
        Map<String, dynamic> json) =>
    SingleDestinationResponse()
      ..destination =
          Destination.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$SingleDestinationResponseToJson(
        SingleDestinationResponse instance) =>
    <String, dynamic>{
      'data': instance.destination,
    };
