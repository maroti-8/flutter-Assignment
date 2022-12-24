import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_profile_screen.dart';
import '../database/local_storage.dart';

class VehicleTrans extends StatefulWidget {
  final Vehicle vehicle;
  final List<String> transType = ["Manual", "Automatic"];
  final LocalStorage storage = LocalStorage();
  VehicleTrans({super.key, required this.vehicle});

  @override
  State<VehicleTrans> createState() => _VehicleTransState();
}

class _VehicleTransState extends State<VehicleTrans> {
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
            itemCount: widget.transType.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text(widget.transType[index],
                          style: const TextStyle(fontSize: 18)),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            widget.vehicle.vehicleTrans =
                                widget.transType[index];
                            try {
                              await widget.storage
                                  .writeSecureData(widget.vehicle);
                            } catch (e) {
                              log(e.toString());
                            }
                            widget.storage.readAllSecureData();
                            if (!mounted) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehicleProfile(
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
