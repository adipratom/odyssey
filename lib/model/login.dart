import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: "id")
  final String id;
  Login({required this.id});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json["id"],
    );
  }
}
