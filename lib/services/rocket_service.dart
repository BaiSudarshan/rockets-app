import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rocketx/models/rocket.dart';

class RocketService {
  Future<List<Rocket>> fetchRockets() async {
    final String apiUrl = 'https://api.spacexdata.com/v4/rockets';
    // print("fetch rocket is called ");
    final response = await http.get(Uri.parse(apiUrl));
    // print(response);
    if (response.statusCode == 200) {
      final List<dynamic> rocketData = json.decode(response.body);
      // print(rocketData);
      final rockets = rocketData.map((data) => Rocket.fromJson(data)).toList();
      return rockets;
    } else {
      // print("Something went wrong while fetching Rocket List");
      return [];
    }
  }
}
