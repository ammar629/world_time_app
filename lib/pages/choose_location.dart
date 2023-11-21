import 'package:flutter/material.dart';
import 'package:world_time_app/utilities/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
// List of Locations
List<WorldTimeApi> locations = [
  WorldTimeApi(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTimeApi(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
  WorldTimeApi(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTimeApi(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTimeApi(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
  WorldTimeApi(url: 'America/New_York', location: 'New York', flag: 'us.png'),
  WorldTimeApi(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.png'),
  WorldTimeApi(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  WorldTimeApi(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
  WorldTimeApi(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'iraq.png'),
];

  @override
  void initState() {
    super.initState();
  }

  void updateTime(int index) async{
    // Create WorldTimeApi Instance
    WorldTimeApi locationInstance = locations[index];
    await locationInstance.getTime();

    // Close this page and send data back to home page
    Navigator.pop(context, {
      'location': locationInstance.location,
      'flag': locationInstance.flag,
      'time': locationInstance.time,
      'isDayTime' : locationInstance.isDayTime,
    });
  }
    

    // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: ()=>{
                  updateTime(index),
                },
                title: Text(
                  locations[index].location
                ),
                leading: Image(
                  image: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              )
            ),
          );
        },
        ),
    );
  }
}