import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  @JsonKey(name: "photo")
  late String photo;

  @JsonKey(name: "review")
  late String review;

  @JsonKey(name: "id")
  late String id;

  @JsonKey(name: "rating")
  late int type;

  Review();

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
