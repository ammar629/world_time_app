// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/utilities/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTimeApi instance =  WorldTimeApi(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();

    // Redirect To Home Page
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: SpinKitCubeGrid(color: Colors.white,
        size: 50,
        )
      ),
    );
  }
}
