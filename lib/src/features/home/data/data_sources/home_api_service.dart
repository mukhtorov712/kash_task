import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/src/features/home/data/models/data_model.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  /// URLS
  static const String _url = 'api/a48e3800cea24694b37b8c6cf8bc1b14/users';

  /// REQUESTS

  @GET(_url)
  Future<HttpResponse<List<DataModel>>> fetchData();
}
