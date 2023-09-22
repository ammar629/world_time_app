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

  WorldTimeApi({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make The API Request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Map The Data
      Map data = jsonDecode(response.body);

      // Get Properties From Data
      String dateTime = data['datetime'];

      // Create A DateTime Object
      DateTime timeData = DateTime.parse(dateTime);

      // Set Time Property
      time = timeData.toString();
    } catch (e) {
      time = '[ERROR] Unable To Fetch Time Data';
    }
  }
}
