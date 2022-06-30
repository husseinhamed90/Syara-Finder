import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../../../../Core/Constants.dart';
import '../../../../../injection_container.dart';
import '../../../../BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import '../../../../BrandsAndModelsAndCars/data/models/Car.dart';

import '../../widgets/AvailableCars/car_list_item.dart';
import 'package:flutter/material.dart';

class AvailableCarScreen extends StatefulWidget {
  @override
  State<AvailableCarScreen> createState() => _AvailableCarScreenState();
}

class _AvailableCarScreenState extends State<AvailableCarScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mPrimaryColor,
      appBar: buildCustomAppBar(),
      body: FutureBuilder<List<Car>>(
        future: context.read<BrandsAndModelsCarsProvider>().fetchCars(),
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

AppBar buildCustomAppBar() {
  return AppBar(
    backgroundColor: HexColor("#FF8308"),
    elevation: 0,
    title: const Text('Available Car'),
  );
}