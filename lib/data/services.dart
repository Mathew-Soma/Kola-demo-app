import 'dart:convert';
import 'package:http/http.dart' as http;

class MobileService {
  final String baseUrl = 'http://192.168.100.226:8069';

  MobileService();

  Future<bool> saveTransaction({
    String? name, 
    String? reciever,
    String? amount,
    String? narration,
    String? pin,
  }) async {
    final url = Uri.parse('$baseUrl/api/save_transaction');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'reciever': reciever,
          'amount': amount,
          'narration': narration,
          'pin': pin,
        }),
      );

      print("Status code: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['success'] == true;
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to save transaction: $e');
    }
  }
}
