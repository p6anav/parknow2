// lib/backend.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendService {
  final String baseUrl = 'https://your-backend-url.com/api'; // Replace with your backend URL

  Future<void> submitContactForm(Map<String, String> formData) async {
    final url = Uri.parse('$baseUrl/submit-contact-form'); // Replace with your API endpoint

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(formData),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Form submitted successfully');
      } else {
        // Handle errors
        throw Exception('Failed to submit form: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Error submitting form: $e');
    }
  }
}
