import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Cars/data/remote/data_sources/CarsApiService.dart';
import 'package:syara_finder/Features/Cars/presentation/manager/CarsProvider.dart';
import '../../../../BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import '../../../data/models/Car.dart';
import '../../../../../Shared/Constants.dart';
import '../../widgets/AvailableCars/car_list_item.dart';
import 'package:syara_finder/Shared/Componantes.dart';
import 'package:flutter/material.dart';

class AvailableCarScreen extends StatefulWidget {
  @override
  State<AvailableCarScreen> createState() => _AvailableCarScreenState();
}

class _AvailableCarScreenState extends State<AvailableCarScreen> {
  CarsProvider? CarsProviderInstance;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    CarsProviderInstance = Provider.of<CarsProvider>(context);
    return Scaffold(
      backgroundColor: mPrimaryColor,
      appBar: buildCustomAppBar(),
      body: FutureBuilder<List<Car>>(
        future: CarsProviderInstance!.fetchCars(),
        builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CarListItem( snapshot.data![index]),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 255, 115, 0)),
                backgroundColor: Color.fromARGB(255, 252, 201, 154),
              ),
            );
          }
          return const Center(
            child: Text("loading..."),
          );
        },
      ),
    );
  }
}