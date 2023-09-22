import 'package:flutter/material.dart';
import 'package:world_time_app/utilities/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTimeApi instance =  WorldTimeApi(location: 'Karachi', flag: '.png', url: 'Asia/Karachi');
    await instance.getTime();

    // Redirect To Home Page
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
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
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('LOADING....'),
        ),
    );
  }
}
