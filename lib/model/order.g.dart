// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      status: json['status'] as String,
      dueDate: json['dueDate'] as String,
      startDate: json['startDate'] as String,
      finishedDate: json['finishedDate'] as String,
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      orderedBy: json['orderedBy'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'dueDate': instance.dueDate,
      'startDate': instance.startDate,
      'finishedDate': instance.finishedDate,
      'destination': instance.destination,
      'orderedBy': instance.orderedBy,
    };
