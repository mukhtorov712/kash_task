import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:task/src/core/resources/data_state.dart';
import 'package:task/src/features/home/data/models/data_model.dart';
import 'package:task/src/features/home/domain/use_cases/fetch_data_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchDataUseCase _fetchDataUseCase;

  HomeBloc(
    this._fetchDataUseCase,
  ) : super(HomeState()) {
    on<FetchDataEvent>((event, emit) async {
      await emit.onEach(_onFetchData(event), onData: emit);
    });
  }

  fetchData() {
    add(FetchDataEvent());
  }

  Stream<HomeState> _onFetchData(FetchDataEvent event) async* {
    yield state.copyWith(status: FetchDataStatus.loading);

    final dataState = await _fetchDataUseCase.call();

    if (dataState is DataSuccess) {
      yield state.copyWith(status: FetchDataStatus.success, list: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(status: FetchDataStatus.error, errorMessage: dataState.message);
    }
  }
}
