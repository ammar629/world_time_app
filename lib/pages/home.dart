import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Data property that will hold information sent by WorldTimeApi request
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {

    // If data is not empty use the data otherwise assign the value of passed arguments
    data = data.isNotEmpty ?  data : ModalRoute.of(context)!.settings.arguments as Map;

    //print(data);

    // Set Background
    String bgImage = data["isDayTime"] ? "day.png" : "night.png";
    Color bgColor = data["isDayTime"] ? Colors.blue : Colors.indigo[700]!;


    // Build the UI
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
                ),
            ),
            child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 120, 0, 0),
                  child: Column(
            children: [
              TextButton.icon(
                onPressed: (() async {
                  dynamic result = await Navigator.pushNamed(context, '/location');

                  setState(() {
                    data = {
                      'location' : result["location"],
                      'flag' : result["flag"],
                      'time' : result["time"],
                      'isDayTime' : result["isDayTime"],
                    };
                  });
                }),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                  ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Image(image:AssetImage('assets/flags/${data['flag']}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 66.0,
                ),
              ),
            ],
                  ),
                ),
          )),
    );
  }
}
