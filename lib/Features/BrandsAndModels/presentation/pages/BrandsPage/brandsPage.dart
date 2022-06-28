// ignore_for_file: file_names

import 'package:syara_finder/Features/BrandsAndModels/domain/entities/BrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import '../../../../../Shared/Componantes.dart';
import '../../manager/BrandsAndModelsProvider.dart';

class brandsPage extends StatelessWidget {
  BrandsAndModelsProvider? brandsAndModelsProviderInstance;
  @override
  Widget build(BuildContext context) {
    brandsAndModelsProviderInstance = Provider.of<BrandsAndModelsProvider>(context);
    return Scaffold(
      appBar: buildAppBar(context, "Brand", Provider.of<HomeProvider>(context)),
      body: FutureBuilder<List<BrandEntity>> (
        builder: (context, AsyncSnapshot<List<BrandEntity>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      brandsAndModelsProviderInstance!.updateCurrentBrand(
                          brandsAndModelsProviderInstance!.brandsObjects[index]);
                    },
                    child: Container(
                        color: (brandsAndModelsProviderInstance!.currentBrand.id ==
                            brandsAndModelsProviderInstance!.brandsObjects[index].id)
                            ? const Color(0xffFF8308).withOpacity(0.09)
                            : const Color(0xffF9FBFC),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 52.h,
                        alignment: Alignment.centerLeft,
                        child: Text(
                            brandsAndModelsProviderInstance!.brandsObjects[index].brandName!)),
                  );
                },
                itemCount: brandsAndModelsProviderInstance!.brandsObjects.length);
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: brandsAndModelsProviderInstance!.fetchBrandsFromApi(),
      ),
    );
  }
}
