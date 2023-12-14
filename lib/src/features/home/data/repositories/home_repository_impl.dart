import 'package:task/src/core/resources/base_repository.dart';
import 'package:task/src/core/resources/data_state.dart';

import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_api_service.dart';
import '../models/data_model.dart';

class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final HomeApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<DataModel>>> fetchData() async => await handleResponse(response: _apiService.fetchData());
}
