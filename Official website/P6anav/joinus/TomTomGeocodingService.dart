import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class TomTomGeocodingService {
  final String apiKey = "8CKwch3uCDAuLbcrffLiAx8IdhU9bGKS"; // Replace with your TomTom API key

  /// Retrieves coordinates for a given place name.
  Future<LatLng> getCoordinates(String placeName) async {
    final url =
        "https://api.tomtom.com/search/2/geocode/$placeName.json?key=$apiKey";

    final response = await _get(url);

    // Check if the response contains valid results
    if (response['results'] != null && response['results'].isNotEmpty) {
      final position = response['results'][0]['position'];
      return LatLng(position['lat'], position['lon']);
    } else {
      throw Exception('No coordinates found for "$placeName".');
    }
  }

  /// Helper method to perform GET requests and handle errors.
  Future<dynamic> _get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error occurred during request: $e');
    }
  }
}
