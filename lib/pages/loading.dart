import 'package:flutter/material.dart';
import 'package:world_time_app/utilities/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "LOADING...";

  void setupWorldTime() async {
    WorldTimeApi instance =  WorldTimeApi(location: 'Dhaka', flag: '.png', url: 'Asia/Dhaka');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
        ),
    );
  }
}
