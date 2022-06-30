// ignore_for_file: file_names

import 'package:flutter/scheduler.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

import '../../../../../Core/Componantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

class modelsPage extends StatefulWidget {
  @override
  _modelsPageState createState() => _modelsPageState();
}

class _modelsPageState extends State<modelsPage> {
  //BrandsAndModelsCarsProvider? brandsAndModelsAndCarsProviderInstance;

  @override
  void initState() {
    // TODO: implement initState

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<BrandsAndModelsCarsProvider>().createListOfYears();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Model And Year"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              Container(
                child: buildTextField(
                    isModelField: true,
                    hintText: "Model",
                    controller: context.watch<BrandsAndModelsCarsProvider>().modelController,
                    isSearchButton: false,
                    ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                child: buildTextField(
                    isModelField: false,
                    hintText: "Year",
                    controller: context.watch<BrandsAndModelsCarsProvider>().yearController,
                    isSearchButton: false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
