import 'package:flutter/material.dart';
import 'package:turbocare_assignment/views/vehicle_profile_screen.dart';

import '../database/local_storage.dart';
import '../models/vehicle.dart';

class VehicleList extends StatefulWidget {
  final LocalStorage storage = LocalStorage();
  VehicleList({super.key});

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: widget.storage.readAllSecureData(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Vehicle List"),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Vehicle loadVehicle = snapshot.data[index];
                    return SizedBox(
                        height: 70,
                        child: Center(
                            child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  loadVehicle.vehicleNumber,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "${loadVehicle.vehicleMake} ${loadVehicle.vehicleModel}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VehicleProfile(
                                                vehicle: loadVehicle,
                                              )));
                                },
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        )));
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
