import 'package:http/http.dart' as http;

const String apiUrl = "http://10.0.2.2:5000";

class BaseClient {
  final client = http.Client();

  Future<dynamic> get(String url) async {
    var endpoint = Uri.parse(apiUrl + url);
    var response = await client.get(endpoint);
    if (response.statusCode == 200) {
      return response.body;
    }

    throw Exception(["Gagal memanggil api..."]);
  }

  Future<dynamic> post(String url, Map<String, dynamic> formData) async {
    var endpoint = Uri.parse(apiUrl + url);

    var response = await client.post(endpoint, body: formData);
    if (response.statusCode == 200) {
      return response.body;
    }

    throw Exception(["Gagal memanggil api..."]);
  }
}
