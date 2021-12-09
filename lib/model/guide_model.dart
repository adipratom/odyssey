import 'package:json_annotation/json_annotation.dart';
part 'guide_model.g.dart';

@JsonSerializable()
class GuideModel {
  @JsonKey(name: "guideName")
  final String guideName;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "contact")
  final String contact;
  @JsonKey(name: "isVerified")
  final bool isVerified;

  GuideModel(
      {required this.guideName,
      required this.isVerified,
      required this.description,
      required this.contact});

  factory GuideModel.fromJson(Map<String, dynamic> json) {
    return GuideModel(
        guideName: json["guideName"],
        isVerified: json["isVerified"],
        contact: json["contact"],
        description: json["description"]);
  }
}
