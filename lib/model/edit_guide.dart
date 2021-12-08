import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EditGuide {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "isVerified")
  final bool isVerified;

  @JsonKey(name: "guideName")
  final String guideName;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "contact")
  final String contact;
  
  @JsonKey(name: "products")
  final String products;

  @JsonKey(name: "bankType")
  final String bankType;

  @JsonKey(name: "bankNumber")
  final int bankNumber;

  @JsonKey(name: "orders")
  final String orders;
      

  EditGuide(
      {required this.id,
      required this.isVerified,
      required this.guideName,
      required this.description,
      required this.contact,
      required this.products,
      required this.bankType,
      required this.bankNumber,
      required this.orders});

  factory EditGuide.fromJson(Map<String, dynamic> json) {    
    return EditGuide(
      isVerified: json["isVerified"],
      guideName: json["guideName"],
      description: json["description"],
      contact: json["contact"],
      products: json['products'],
      bankType: json["bankType"],
      bankNumber: json["bankNumber"],
      orders : json["orders"],
      id: json["id"],
    );
  }
}