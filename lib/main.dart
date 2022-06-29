import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:syara_finder/Features/Authentication/data/local/data_sources/SharedPrefSource.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import 'package:syara_finder/Features/BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import 'Features/Cars/presentation/manager/CarsProvider.dart';
import 'Features/Home/presentation/manager/HomeProvider.dart';
import 'Features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  await SharedPrefSource.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.dependencyInjectionInstance<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => di.dependencyInjectionInstance<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.dependencyInjectionInstance<BrandsAndModelsProvider>()),
        ChangeNotifierProvider(create: (context) => di.dependencyInjectionInstance<CarsProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
