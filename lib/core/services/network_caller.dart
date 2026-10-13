import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  static final Logger _logger = Logger();
  ////////////////////////////////////////.. GET Api../////////////////////////////////////////////////
  static Future<ApiResponse> getRequest({
    required String url,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          if (token != null && token.isNotEmpty)
            'Authorization': 'Bearer $token',
        },
      );

      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        // SUCCESS
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
          errorMessage: " ",
        );
      } else {
        // FAILED
        final decodedData = jsonDecode(response.body);

        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
          // errorMessage: decodedData['data'],
          errorMessage: " ",
        );
      }
    } on SocketException {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: "No internet! Check your connection.",
      );
    } on ClientException {
      return ApiResponse(
        isSuccess: false,
        responseCode: -2,
        responseData: null,
        errorMessage: "Connection lost or poor network connection.",
      );
    } catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  // LOGGER
  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'URL => $url\n'
      'Request Body: $body',
    );
  }

  static void _logResponse(String url, Response response) {
    _logger.i(
      'URL => $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}

// RESPONSE CLASS
class ApiResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic responseData;
  final String errorMessage;

  ApiResponse({
    required this.isSuccess,
    required this.responseCode,
    required this.responseData,
    required this.errorMessage,
  });
}
