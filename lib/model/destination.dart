import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/builder.dart';
import 'package:odyssey/model/review.dart';
part 'destination.g.dart';

@JsonSerializable()
class Destination {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "guide")
  final String guide;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "activityLevel")
  final String activityLevel;

  @JsonKey(name: "review")
  final List<Review> review;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "benefits")
  final String benefits;

  @JsonKey(name: "photo")
  final String photo;

  @JsonKey(name: "price")
  final int price;

  @JsonKey(name: "rating")
  final int rating;

  @JsonKey(name: "name")
  final String name;

  Destination(
      {required this.name,
      required this.rating,
      required this.price,
      required this.photo,
      required this.benefits,
      required this.description,
      required this.activityLevel,
      required this.type,
      required this.review,
      required this.guide,
      required this.id});

  // factory Destination.fromJson(Map<String, dynamic> json) =>
  //     _$DestinationFromJson(json);
  // Map<String, dynamic> toJson() => _$DestinationToJson(this);
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      activityLevel: json["activityLevel"],
      name: json["name"],
      rating: json["rating"],
      price: json["price"],
      photo: json["photo"],
      benefits: json["benefits"],
      description: json["description"],
      type: json["type"],
      guide: json["guide"],
      id: json["id"],
      review: json["review"].cast<Review>(),
    );
  }
}
