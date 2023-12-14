import 'package:task/src/core/resources/data_state.dart';
import 'package:task/src/features/home/data/models/data_model.dart';

abstract class HomeRepository {
  Future<DataState<List<DataModel>>> fetchData();
}
