// ignore_for_file: avoid_print
import 'package:http/http.dart';
import 'dart:convert';

class WorldTimeApi {
  // Location Name For The UI
  String location;

  // The Time In The Location
  late String time;

  // Flag Asset Icon URL
  String flag;

  // Location API Endpoint URL
  String url;

  // To Indicate If To Display Sunny Or Dark Background Image
  late bool isDayTime;

  WorldTimeApi({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make The API Request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Map The Data
      Map data = jsonDecode(response.body);

      print(data);

      // Get Properties From Data
      String dateTime = data['datetime'];

      String timeStorage = await extractTime(dateTime);

      // Check For Day / Night
      isDayTime = await checkForTime(timeStorage);

      // Set Time
      time = timeStorage;
    } catch (e, stackTrace) {
      print('[ERROR] $e \nStackTrace: \n\n\n$stackTrace'); 
      time = '[ERROR] Unable To Fetch Time Data';
    }
  }

  Future<String> extractTime(String timeData) async {
    return timeData.substring(11, 16);
  }

  Future<bool> checkForTime(String timeStorage) async {
    int timeNow = int.parse(timeStorage.substring(0, 2));
    print(timeNow);
    return (timeNow > 6 && timeNow < 20 ? true : false);
  }
}
