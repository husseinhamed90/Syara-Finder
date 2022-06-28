// ignore_for_file: file_names

import 'package:flutter/scheduler.dart';
import 'package:syara_finder/Features/BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

import '../../../../../Shared/Componantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

class modelsPage extends StatefulWidget {
  @override
  _modelsPageState createState() => _modelsPageState();
}

class _modelsPageState extends State<modelsPage> {
  BrandsAndModelsProvider? brandsAndModelsProviderInstance;

  @override
  void initState() {
    // TODO: implement initState

    SchedulerBinding.instance.addPostFrameCallback((_) {
      brandsAndModelsProviderInstance = Provider.of<BrandsAndModelsProvider>(context, listen: false);
     // appProviderInstance!.createListOfModels();
      brandsAndModelsProviderInstance!.createListOfYears();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    brandsAndModelsProviderInstance = Provider.of<BrandsAndModelsProvider>(context);

    return Scaffold(
      appBar: buildAppBar(context, "Model And Year", Provider.of<HomeProvider>(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              Container(
                child: buildTextField(
                    isModelField: true,
                    hintText: "Model",
                    controller: brandsAndModelsProviderInstance!.modelController,
                    isSearchButton: false,
                    appProviderInstance: brandsAndModelsProviderInstance),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                child: buildTextField(
                    isModelField: false,
                    hintText: "Year",
                    controller: brandsAndModelsProviderInstance!.yearController,
                    isSearchButton: false,
                    appProviderInstance: brandsAndModelsProviderInstance),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
