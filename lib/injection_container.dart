import 'package:get_it/get_it.dart';
import 'package:syara_finder/Features/Authentication/data/local/data_sources/SharedPrefSource.dart';
import 'Features/Authentication/data/repositories/AuthRepositoryImpl.dart';
import 'Features/Authentication/domain/repositories/AuthRepository.dart';
import 'Features/Authentication/presentation/manager/AuthProvider.dart';
import 'Features/BrandsAndModelsAndCars/data/repositories/BrandsAndModelsRepositoryImple.dart';
import 'Features/BrandsAndModelsAndCars/domain/repositories/BrandsAndModelsRepository.dart';
import 'Features/BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import 'Features/Home/presentation/manager/HomeProvider.dart';

final dependencyInjection = GetIt.instance;

Future<void> init() async {

  // Repositories
  dependencyInjection.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpli());
  dependencyInjection.registerLazySingleton<BrandsAndModelsRepository>(() => BrandsAndModelsRepositoryImple());

  // Providers
  dependencyInjection.registerLazySingleton(() => HomeProvider());
  dependencyInjection.registerLazySingleton(() => BrandsAndModelsCarsProvider());
  dependencyInjection.registerLazySingleton(() => AuthProvider());

  //Third Party Libraries
  dependencyInjection.registerLazySingleton(() => SharedPrefSource());


}