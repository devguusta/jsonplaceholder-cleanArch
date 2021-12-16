import 'package:dio/native_imp.dart';
import 'package:json_clean/app/core/endpoints/jsonplaceholder_endpoint.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = JsonPlaceHolderEndPoints.apiKey;
    options.contentTypeWithRequestBody("application/json");
    interceptors.addAll([
      // TokenInterceptors(),
    ]);
  }
}
