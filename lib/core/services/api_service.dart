import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams);
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams) async {
    final response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParams),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Couldn\'t get data: status code ${response.statusCode}');
    }
  }
}
