import 'dart:convert';

import 'package:cat_api/src/models/cat_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template cat_api}
/// A public service API all about Cats.
/// {@endtemplate}
class CatApi {
  /// {@macro cat_api}
  CatApi({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  /// API url base
  static String base = dotenv.get('THE_CAT_API_URL');

  final http.Client _httpClient;

  /// Fetches all cats.
  ///
  /// REST call: `GET /breeds`
  Future<List<CatModel>> fetchAllCats() async {
    final uri = Uri.https(base, '/v1/breeds');
    final responseBody = await _get(uri);

    try {
      return responseBody
          .map((dynamic item) => CatModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Fetch cat image.
  ///
  /// REST call: `GET /images`
  Future<String> fetchCatImage(String referenceImage) async {
    final uri = Uri.https(base, '/v1/images/$referenceImage');
    final responseBody = await _getBody(uri);

    try {
      return responseBody['url'] as String;
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<dynamic>> _get(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      return json.decode(response.body) as List;
    } catch (_) {
      throw JsonDecodeException();
    }
  }

  Future<dynamic> _getBody(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      return json.decode(response.body);
    } catch (_) {
      throw JsonDecodeException();
    }
  }
}
