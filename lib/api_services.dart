import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String nasaApiKey = '0D3rMu63z4FzeL29M6PiIbg5rNHjeY6q0YTZ3MnA'; // NASA registered developers API Key

  Future<Map<String, dynamic>> fetchApod(date) async {
    final response = await http.get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$nasaApiKey&thumbs=true&date=$date'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Astronomy Picture of the Day');
    }
  }
}
