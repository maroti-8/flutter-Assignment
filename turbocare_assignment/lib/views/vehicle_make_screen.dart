import 'package:flutter/material.dart';
import 'package:turbocare_assignment/services/api_service.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_model_screen.dart';

class VehicleMake extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleMake({super.key, required this.vehicle});

  @override
  State<VehicleMake> createState() => _VehicleMakeState();
}

class _VehicleMakeState extends State<VehicleMake> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: (widget.vehicle.vehicleClass == "2w")
            ? ApiService.fetchTwoWheeler()
            : ApiService.fetchFourWheeler(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Vehicle Make"),
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
                                  widget.vehicle.vehicleMake =
                                      snapshot.data[index].toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VehicleModel(
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
