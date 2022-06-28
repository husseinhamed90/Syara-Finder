// ignore_for_file: file_names
import 'package:syara_finder/Features/BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import 'package:syara_finder/Features/BrandsAndModels/presentation/pages/BrandsPage/brandsPage.dart';

import 'package:syara_finder/Shared/Componantes.dart';


import '../../../../Cars/data/models/Car.dart';
import '../../../../Home/presentation/manager/HomeProvider.dart';
import '../../widgets/FilteredListPage/listOfCars.dart';
import '../ModelsPage/modelsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

class FilteredList extends StatelessWidget {
  BrandsAndModelsProvider ?brandsAndModelsProviderInstance;
  List<Car>filteredCars=[];

  @override
  Widget build(BuildContext context) {
    brandsAndModelsProviderInstance = Provider.of<BrandsAndModelsProvider>(context);
    //appProviderInstance!.parseCarsJson();
    //filteredCars= appProviderInstance!.getFilteredCars()!;
    return Scaffold(
      appBar: buildAppBar(context, "Explore",Provider.of<HomeProvider>(context)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(17.h),
                child: Column(
                  children: [
                    Container(
                      child: buildTextField(
                          hintText: "Location",
                          controller: brandsAndModelsProviderInstance!.locationController,
                          appProviderInstance: brandsAndModelsProviderInstance
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildSection(title: "Brand",subTitle: (brandsAndModelsProviderInstance!.currentBrand.brandName!=null)?brandsAndModelsProviderInstance!.currentBrand.brandName:"No Brand Selected",context: context,nextPage: brandsPage(),isClickable: false),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                                  height: 52.h,
                                  width: 1.w,
                                  color: const Color(0xff959595),
                                ),
                                buildSection(title: "Model",subTitle:(brandsAndModelsProviderInstance!.selectedModel!=null)?brandsAndModelsProviderInstance!.selectedModel!.modelName:"No Model Selected"  ,context: context,nextPage: modelsPage(),isClickable: false),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 85.h,child: Row(
                      children: [
                        buildText("${filteredCars.length} cars found",const Color(0xff959595)),
                        const Spacer(),
                        buildText("Filters",const Color(0xffFF8308)),
                        SizedBox(width: 8.25.w,),
                        const Icon(Icons.filter_list_outlined,color: Color(0xffFF8308),)
                      ],
                    ),),
                     listOfCars(filteredCars: filteredCars)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



