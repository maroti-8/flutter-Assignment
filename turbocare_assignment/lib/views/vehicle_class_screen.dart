import 'package:flutter/material.dart';

class VehicleClass extends StatelessWidget {
  const VehicleClass({super.key});

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
                            onPressed: () {},
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
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
