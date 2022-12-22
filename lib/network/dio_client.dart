import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;
  static final DioClient instance = DioClient.init();

  final token = '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';

  Options get defaultOption => Options(headers: {
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer $token',
        'X-GitHub-Api-Version': '2022-11-28',
      });

  DioClient.init() {
    dio = Dio();
  }

  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, dynamic> headre = const {},
  }) async {
    try {
      final options = defaultOption;
      options.headers?.addAll(headre);
      var response = await Dio().get(url, options: options);

      ApiStatus status = ApiStatus.empty;
      switch (response.statusCode) {
        case 200:
          status = ApiStatus.success;
          if (response.data == null) {
            status = ApiStatus.noData;
          }
          break;
        case 500:
          status = ApiStatus.serverError;
          break;
      }

      return ApiResponse(apiStatus: status, data: response.data);
    } catch (e) {
      if (e is DioError && e.type == DioErrorType.cancel) {
        return ApiResponse(apiStatus: ApiStatus.canceled);
      } else if (e is DioError && e.type == DioErrorType.connectTimeout) {
        return ApiResponse(apiStatus: ApiStatus.networkError);
      } else {
        return ApiResponse(apiStatus: ApiStatus.clientError);
      }
    }
  }
}

class ApiResponse<T> {
  T? data;
  ApiStatus apiStatus;
  ApiResponse({
    this.data,
    required this.apiStatus,
  });
}

enum ApiStatus {
  empty,
  success,
  loading,
  noData,
  networkError,
  serverError,
  clientError,
  canceled
}
