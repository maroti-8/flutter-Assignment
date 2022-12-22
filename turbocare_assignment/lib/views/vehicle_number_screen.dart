import 'package:flutter/material.dart';

class VehicleNumber extends StatelessWidget {
  const VehicleNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Widget enterVehicleNumber = Container(
      padding: const EdgeInsets.all(40),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: const [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "VEHICLE NUMBER",
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
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
            backgroundColor: Colors.blue,
            child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ),
        ))
      ]),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Vehicle Profile"),
      ),
      body: enterVehicleNumber,

      /* const BottomAppBar(
          child: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
      )) */
    );
  }
}
