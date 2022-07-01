// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Core/Componantes.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/presentation/pages/BrandsPage/brandsPage.dart';

import '../../../data/models/Car.dart';
import '../../widgets/FilteredListPage/customTextForFilteredListPage.dart';
import '../../widgets/FilteredListPage/listOfCars.dart';
import '../ModelsPage/modelsPage.dart';

class FilteredList extends StatelessWidget {
  List<Car>filteredCars=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Explore"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(17.h),
          child: Column(
            children: [
              Container(
                child: buildTextField(
                    hintText: "Location",
                    controller: context.watch<BrandsAndModelsCarsProvider>().locationController,
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
                          buildSection(title: "Brand",subTitle: (context.watch<BrandsAndModelsCarsProvider>().currentBrand.brandName!=null)?context.watch<BrandsAndModelsCarsProvider>().currentBrand.brandName:"No Brand Selected",context: context,nextPage: brandsPage(),isClickable: false),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                            height: 52.h,
                            width: 1.w,
                            color: const Color(0xff959595),
                          ),
                          buildSection(title: "Model",subTitle:(context.watch<BrandsAndModelsCarsProvider>().selectedModel!=null)?context.watch<BrandsAndModelsCarsProvider>().selectedModel!.modelName:"No Model Selected"  ,context: context,nextPage: modelsPage(),isClickable: false),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 85.h,child: Row(
                children: [
                  ValueListenableBuilder<List<Car>>(
                    valueListenable: context.watch<BrandsAndModelsCarsProvider>().filteredCars,
                      builder: (context, value, child) => CustomTextForFilteredListPage(text:"${value.length} cars found",color: const Color(0xff959595))),
                  const Spacer(),
                  CustomTextForFilteredListPage(text: "Filters",color: const Color(0xffFF8308)),
                  SizedBox(width: 8.25.w,),
                  const Icon(Icons.filter_list_outlined,color: Color(0xffFF8308),)
                ],
              ),),
              listOfCars(filteredars: context.watch<BrandsAndModelsCarsProvider>().filterCar(context.watch<BrandsAndModelsCarsProvider>().currentBrand.brandName),)
            ],
          ),
        ),
      ),
    );
  }
}



