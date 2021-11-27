import 'package:json_annotation/json_annotation.dart';
import 'package:odyssey/model/destination.dart';

import 'multiple_destination_response.g.dart';

@JsonSerializable()
class MultipleDestinationResponse {
  @JsonKey(name: "data")
  late List<Destination> destination;

  MultipleDestinationResponse();

  factory MultipleDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$MultipleDestinationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleDestinationResponseToJson(this);
}
