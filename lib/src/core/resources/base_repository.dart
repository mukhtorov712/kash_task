import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/src/core/extensions/dio_error.dart';

import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T>> handleResponse<T>({required Future<HttpResponse<T>> response}) async {
    try {
      final httpResponse = await response;
      return DataSuccess(
        data: httpResponse.data,
        message: "Error!",
        code: httpResponse.response.statusCode,
      );
    } on DioError catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        return const DataFailed(message: "Something went wrong");
      } else if (e.isBadRequest) {
        final message = e.response?.data?['message'] ?? 'Bad request';
        return DataFailed(message: message);
      } else {
        return const DataFailed(message: "Something went wrong");
      }
    }
  }
}
