import 'package:flutter/material.dart';
import 'package:turbocare_assignment/views/vehicle_list_screen.dart';
import 'package:turbocare_assignment/views/vehicle_number_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget homePageButtons = Container(
      padding: const EdgeInsets.all(24),
      child: Center(
          child: Column(children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VehicleNumber()));
            },
            child: const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                "Create new vehicle Profile")),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VehicleList()));
            },
            child: const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                "Vehicle List")),
      ])),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: homePageButtons,
    );
  }
}
