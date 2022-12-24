import 'package:flutter/material.dart';
import 'package:turbocare_assignment/models/vehicle.dart';
import 'package:turbocare_assignment/views/vehicle_make_screen.dart';

class VehicleClass extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleClass({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    Widget selectVehicleClass = Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const Text("Two Wheeler"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              vehicle.vehicleClass = "2w";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VehicleMake(
                                            vehicle: vehicle,
                                          )));
                            },
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const Text("Four Wheeler"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              vehicle.vehicleClass = "4w";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VehicleMake(
                                            vehicle: vehicle,
                                          )));
                            },
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Vehicle Class"),
      ),
      body: selectVehicleClass,
    );
  }
}
