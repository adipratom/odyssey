import 'package:json_annotation/json_annotation.dart';
import 'package:odyssey/model/guide_model.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "profilePicture")
  final String profilePicture;

  @JsonKey(name: "headerPicture")
  final String headerPicture;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "phone")
  final String phone;

  @JsonKey(name: "address")
  final String address;

  @JsonKey(name: "isGuide")
  final bool isGuide;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "guideDetails")
  final GuideModel? guideDetails;

  ProfileModel(
      {required this.description,
      required this.profilePicture,
      required this.headerPicture,
      required this.name,
      required this.phone,
      required this.address,
      required this.id,
      required this.isGuide,
      required this.guideDetails});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        description: json["description"],
        profilePicture: json["profilePicture"],
        headerPicture: json["headerPicture"],
        name: json["name"],
        id: json["id"],
        phone: json["phone"],
        address: json["address"],
        guideDetails: json["guideDetails"] != null
            ? GuideModel.fromJson(json['guideDetails'])
            : null,
        isGuide: json["isGuide"]);
  }
}
