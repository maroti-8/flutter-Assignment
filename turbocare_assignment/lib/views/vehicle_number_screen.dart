import 'package:flutter/material.dart';
import 'package:turbocare_assignment/views/vehicle_class_screen.dart';

class VehicleNumber extends StatelessWidget {
  const VehicleNumber({super.key});

  @override
  Widget build(BuildContext context) {
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
        const TextField(
          decoration: InputDecoration(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleClass()));
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
