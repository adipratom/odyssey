import 'package:json_annotation/json_annotation.dart';
import 'package:odyssey/model/destination.dart';


@JsonSerializable()
class Order {


  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "dueDate")
  final String dueDate;

  @JsonKey(name: "startDate")
  final String startDate;

  @JsonKey(name: "finishedDate")
  final String finishedDate;

  @JsonKey(name: "destination")
  final Destination? destination;

  @JsonKey(name: "orderedBy")
  final String orderedBy;

  @JsonKey(name: "totakPrice")
  final String totalPrice;

  Order(
      {required this.status,
      required this.dueDate,
      required this.startDate,
      required this.finishedDate,
      required this.destination,
      required this.orderedBy,
      required this.id,
      required this.totalPrice});

  // Order({required this.id, required this.order});

  factory Order.fromJson(Map<String, dynamic> json) {
    // List<Destination> destinations = json['destination'].map((item) => item as Destination).toList();
    return Order(
      status: json["status"],
      dueDate: json["dueDate"],
      startDate: json["startDate"],
      finishedDate: json["finishedDate"],
      destination: json['destination'] != null ? Destination.fromJson(json['destination']) : null,
      orderedBy: json["orderedBy"],
      id: json["id"],
      totalPrice: json["totalPrice"],
    );
  }
}
