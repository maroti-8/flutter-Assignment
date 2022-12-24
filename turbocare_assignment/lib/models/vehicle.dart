import 'dart:convert';

class Vehicle {
  String vehicleNumber;
  String vehicleClass;
  String vehicleMake;
  String vehicleModel;
  String vehicleFuel;
  String vehicleTrans;

  Vehicle({
    required this.vehicleNumber,
    required this.vehicleClass,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.vehicleFuel,
    required this.vehicleTrans,
  });

  factory Vehicle.fromJson(Map<String, dynamic> jsonData) => Vehicle(
        vehicleNumber: jsonData['vehicleNumber'],
        vehicleClass: jsonData['vehicleClass'],
        vehicleMake: jsonData['vehicleMake'],
        vehicleModel: jsonData['vehicleModel'],
        vehicleFuel: jsonData['vehicleFuel'],
        vehicleTrans: jsonData['vehicleTrans'],
      );

  static Map<String, dynamic> toMap(Vehicle model) => <String, dynamic>{
        'vehicleNumber': model.vehicleNumber,
        'vehicleClass': model.vehicleClass,
        'vehicleMake': model.vehicleMake,
        'vehicleModel': model.vehicleModel,
        'vehicleFuel': model.vehicleFuel,
        'vehicleTrans': model.vehicleTrans,
      };

  static String serialize(Vehicle model) => json.encode(Vehicle.toMap(model));

  static Vehicle deserialize(String json) => Vehicle.fromJson(jsonDecode(json));
}
