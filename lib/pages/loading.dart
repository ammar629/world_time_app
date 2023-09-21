import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    // Make The API Request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Karachi'));

    // Map The Data
    Map data = jsonDecode(response.body);


    // Get Properties From Data
    String dateTime = data['datetime'];
    
    // Create A DateTime Object
    DateTime time = DateTime.parse(dateTime);
    print(time.timeZoneName);
  }

  @override
  void initState(){
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('')),
    );
  }
}