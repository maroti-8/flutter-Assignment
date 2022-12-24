import 'package:flutter/material.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_trans_screen.dart';

class VehicleFuel extends StatefulWidget {
  final Vehicle vehicle;
  final List<String> fuelList = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol + CNG",
    "Electric",
    "Hubrid"
  ];
  VehicleFuel({super.key, required this.vehicle});

  @override
  State<VehicleFuel> createState() => _VehicleFuelState();
}

class _VehicleFuelState extends State<VehicleFuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Fuel Type"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: widget.fuelList.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text(widget.fuelList[index],
                          style: const TextStyle(fontSize: 18)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            widget.vehicle.vehicleFuel = widget.fuelList[index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehicleTrans(
                                          vehicle: widget.vehicle,
                                        )));
                          },
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ));
            }),
      ),
    );
  }
}
