import 'package:flutter/material.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_class_screen.dart';

class VehicleNumber extends StatelessWidget {
  final TextEditingController vehicleController = TextEditingController();
  VehicleNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Vehicle vehicle = Vehicle(
        vehicleNumber: "",
        vehicleClass: "",
        vehicleMake: "",
        vehicleModel: "",
        vehicleFuel: "",
        vehicleTrans: "");
    Widget enterVehicleNumber = Container(
      padding: const EdgeInsets.all(40),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "VEHICLE NUMBER",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: vehicleController,
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey)),
              hintText: "Enter Vehicle Number"),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepPurple,
              child: IconButton(
                onPressed: () {
                  vehicle.vehicleNumber = vehicleController.text.toUpperCase();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VehicleClass(
                                vehicle: vehicle,
                              )));
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 40, color: Colors.white),
              )),
        ))
      ]),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Vehicle Profile"),
      ),
      body: enterVehicleNumber,
    );
  }
}
