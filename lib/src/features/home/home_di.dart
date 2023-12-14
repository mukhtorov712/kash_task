import "package:task/src/features/home/domain/use_cases/fetch_data_use_case.dart";

import "../../core/locator.dart";
import "data/data_sources/home_api_service.dart";
import "data/repositories/home_repository_impl.dart";
import "domain/repositories/home_repository.dart";
import "presentation/manager/home_bloc.dart";

Future<void> homeDI() async {
  // DataSources
  locator.registerSingleton(HomeApiService(locator()));

  // Repositories
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(FetchDataUseCase(locator()));

  // Blocs
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator()));
}
