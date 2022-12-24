import 'package:flutter/material.dart';
import 'package:turbocare_assignment/services/api_service.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_fuel_screen.dart';

class VehicleModel extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleModel({super.key, required this.vehicle});

  @override
  State<VehicleModel> createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: ApiService.fetchModel(
            widget.vehicle.vehicleClass, widget.vehicle.vehicleMake),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Vehicle Model"),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Text(snapshot.data[index].toString()),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  widget.vehicle.vehicleModel =
                                      snapshot.data[index];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VehicleFuel(
                                                vehicle: widget.vehicle,
                                              )));
                                },
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ));
                  },
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
