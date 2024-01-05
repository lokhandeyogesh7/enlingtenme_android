import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_endpoints.dart';
import 'common.dart';
import 'device_utils.dart';

class DioInstance {
  static Dio? _instance;
  static Future<Dio?> createInstance({BaseOptions? options}) async {
    final Common _common = Common();
    if (_instance == null) {
      Dio dio = Dio();
      dio = Dio(
        BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          headers: {
            'app-version': await DeviceUtils.appVersion(),
            'build-version': await DeviceUtils.buildVersion(),
            'os': (Platform.isIOS) ? 'iOS' : 'Android',
          },
        ),
      );
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      _instance = dio;
    }
    return _instance;
  }
}