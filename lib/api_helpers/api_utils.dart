import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUtils {
  static String get baseUrl => dotenv.env['BASEURL'] ?? '';

  //end point
  static const String jokes = 'jokes/random';
}
