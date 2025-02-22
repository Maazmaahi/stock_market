import 'dart:developer';

import 'package:dio/dio.dart';
import '../../core/core.dart';
import '../models/stock.dart';
import '../models/stock_price_graph.dart';
import '../models/user.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://illuminate-production.up.railway.app/api';
  final _storage = StorageManger();

  // Logs a cURL command for debugging API requests
  void _logCurlRequest(String method, String url, Map<String, dynamic>? queryParams, Map<String, String>? headers) {
    String curlCommand = "curl -X $method '$url'";

    if (queryParams != null && queryParams.isNotEmpty) {
      curlCommand += "?${queryParams.entries.map((e) => "${e.key}=${e.value}").join("&")}";
    }

    if (headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        curlCommand += " -H '$key: $value'";
      });
    }

    log("cURL request: $curlCommand");
  }

  Future<User> login(String identifier, String password) async {
    final url = '$_baseUrl/auth/local';
    final data = {'identifier': identifier, 'password': password};

    try {
      _logCurlRequest("POST", url, null, null);
      final response = await _dio.post(url, data: data);

      final user = User.fromJson(response.data['user']);
      await _storage.storeToken(response.data['jwt']);
      await _storage.storeUser(user);
      return user;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<List<Stock>> searchStocks(String query) async {
    final token = await _storage.getToken();
    final url = '$_baseUrl/stocks/search';
    final queryParams = {'query': query};
    final headers = {'Authorization': 'Bearer $token'};

    try {
      _logCurlRequest("GET", url, queryParams, headers);
      final response = await _dio.get(url, queryParameters: queryParams, options: Options(headers: headers));

      return (response.data as List).map((json) => Stock.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Stock search failed');
    }
  }

  Future<Stock> getStockById(int id) async {
    final token = await _storage.getToken();
    final url = '$_baseUrl/stocks/$id';
    final headers = {'Authorization': 'Bearer $token'};

    try {
      _logCurlRequest("GET", url, null, headers);
      final response = await _dio.get(url, options: Options(headers: headers));

      return Stock.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to fetch stock details');
    }
  }

  Future<StockPriceGraph> getStockPriceGraph(int id, String range) async {
    final token = await _storage.getToken();
    final url = '$_baseUrl/stocks/$id/price-graph';
    final queryParams = {'range': range};
    final headers = {'Authorization': 'Bearer $token'};

    try {
      _logCurlRequest("GET", url, queryParams, headers);
      final response = await _dio.get(url, queryParameters: queryParams, options: Options(headers: headers));

      return StockPriceGraph.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to fetch stock price graph');
    }
  }
}
