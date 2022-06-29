import 'package:get_it/get_it.dart';
import 'package:syara_finder/Features/Authentication/data/local/data_sources/SharedPrefSource.dart';
import 'Features/Authentication/data/repositories/AuthRepositoryImpl.dart';
import 'Features/Authentication/domain/repositories/AuthRepository.dart';
import 'Features/Authentication/presentation/manager/AuthProvider.dart';
import 'Features/BrandsAndModels/data/repositories/BrandsAndModelsRepositoryImple.dart';
import 'Features/BrandsAndModels/domain/repositories/BrandsAndModelsRepository.dart';
import 'Features/BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import 'Features/Cars/data/repositories/CarsRepository.dart';
import 'Features/Cars/domain/repositories/CarsRepositoryImpl.dart';
import 'Features/Cars/presentation/manager/CarsProvider.dart';
import 'Features/Home/presentation/manager/HomeProvider.dart';

final dependencyInjectionInstance = GetIt.instance;

Future<void> init() async {

  // Repositories
  dependencyInjectionInstance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpli());
  dependencyInjectionInstance.registerLazySingleton<BrandsAndModelsRepository>(() => BrandsAndModelsRepositoryImple());
  dependencyInjectionInstance.registerLazySingleton<CarsRepository>(() => CarsRepositoryImpl());

  // Providers
  dependencyInjectionInstance.registerLazySingleton(() => HomeProvider());
  dependencyInjectionInstance.registerLazySingleton(() => BrandsAndModelsProvider(dependencyInjectionInstance()));
  dependencyInjectionInstance.registerLazySingleton(() => AuthProvider(dependencyInjectionInstance(),dependencyInjectionInstance(),dependencyInjectionInstance()));
  dependencyInjectionInstance.registerLazySingleton(() => CarsProvider(dependencyInjectionInstance(),));

  dependencyInjectionInstance.registerLazySingleton(() => SharedPrefSource());


}