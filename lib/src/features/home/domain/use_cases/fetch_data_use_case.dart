import 'package:task/src/core/resources/data_state.dart';
import 'package:task/src/core/resources/use_case.dart';
import 'package:task/src/features/home/data/models/data_model.dart';

import '../../../../../../src/features/home/domain/repositories/home_repository.dart';

class FetchDataUseCase implements UseCase<DataState<List<DataModel>?>, dynamic> {
  final HomeRepository _repository;

  FetchDataUseCase(this._repository);

  @override
  Future<DataState<List<DataModel>?>> call({dynamic params}) async => await _repository.fetchData();
}
