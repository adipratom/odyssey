import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';
import 'package:odyssey/model/review.dart';
part 'destination.g.dart';

@JsonSerializable()
class Destination {
  @JsonKey(name: "id")
  late String id;

  @JsonKey(name: "guide")
  late String guide;

  @JsonKey(name: "type")
  late String type;

  @JsonKey(name: "activityLevel")
  late String activityLevel;

  @JsonKey(name: "review")
  late List<Review> review;

  @JsonKey(name: "description")
  late String description;

  @JsonKey(name: "benefits")
  late String benefits;

  @JsonKey(name: "photo")
  late String photo;

  @JsonKey(name: "price")
  late int price;

  @JsonKey(name: "rating")
  late int rating;

  Destination();

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
