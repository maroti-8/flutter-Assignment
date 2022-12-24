import 'package:flutter/material.dart';
import 'package:turbocare_assignment/database/local_storage.dart';
import 'package:turbocare_assignment/models/vehicle.dart';

class VehicleProfile extends StatefulWidget {
  final Vehicle vehicle;
  final LocalStorage storage = LocalStorage();
  VehicleProfile({super.key, required this.vehicle});

  @override
  State<VehicleProfile> createState() => _VehicleProfileState();
}

class _VehicleProfileState extends State<VehicleProfile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: widget.storage.readSecureData(widget.vehicle.vehicleNumber),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            Vehicle loadVehicle = snapshot.data;
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(250),
                  child: AppBar(
                    flexibleSpace: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "${widget.vehicle.vehicleModel.toUpperCase()} ${widget.vehicle.vehicleFuel.toUpperCase()}",
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Text(widget.vehicle.vehicleNumber.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    ), //appbar title
                  )),
              body: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (6 / 4),
                  ),
                  shrinkWrap: true,
                  children: [
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "MAKE",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          loadVehicle.vehicleMake.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "MODEL",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          loadVehicle.vehicleModel.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "FUEL TYPE",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          loadVehicle.vehicleFuel.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "TRANSMISSION",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          loadVehicle.vehicleTrans.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )),
                  ]),
            );
          } else {
            return const CircularProgressIndicator();
          }

          /* Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: AppBar(
            flexibleSpace: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      "${widget.vehicle.vehicleModel.toUpperCase()} ${widget.vehicle.vehicleFuel.toUpperCase()}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  Text(widget.vehicle.vehicleNumber.toUpperCase(),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ), //appbar title
          )),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (6 / 4),
          ),
          shrinkWrap: true,
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "MAKE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.vehicle.vehicleMake.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "MODEL",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.vehicle.vehicleModel.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "FUEL TYPE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.vehicle.vehicleFuel.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "TRANSMISSION",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.vehicle.vehicleTrans.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            )),
          ]),
    ); */
        });
  }
}
