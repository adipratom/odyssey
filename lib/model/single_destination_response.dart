import 'package:json_annotation/json_annotation.dart';

import 'package:odyssey/model/destination.dart';
part 'single_destination_response.g.dart';

@JsonSerializable()
class SingleDestinationResponse {

  @JsonKey(name: "data")
  late Destination destination;

  SingleDestinationResponse();

  factory SingleDestinationResponse.fromJson(Map<String, dynamic> json) => _$SingleDestinationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleDestinationResponseToJson(this);
}