// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/domain/entities/BrandEntity.dart';
import '../../../../../Core/Componantes.dart';
import '../../manager/BrandsAndModelsProvider.dart';

class brandsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Brand"),
      body: FutureBuilder<List<BrandEntity>> (
        builder: (context, AsyncSnapshot<List<BrandEntity>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<BrandsAndModelsCarsProvider>().updateCurrentBrand(context.read<BrandsAndModelsCarsProvider>().brandsObjects[index]);
                    },
                    child: Container(
                        color: (context.watch<BrandsAndModelsCarsProvider>().currentBrand.id == context.watch<BrandsAndModelsCarsProvider>().brandsObjects[index].id)
                            ? const Color(0xffFF8308).withOpacity(0.09)
                            : const Color(0xffF9FBFC),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 52.h,
                        alignment: Alignment.centerLeft,
                        child: Text(context.read<BrandsAndModelsCarsProvider>().brandsObjects[index].brandName!)),
                  );
                },
                itemCount: context.read<BrandsAndModelsCarsProvider>().brandsObjects.length);
          }
          else{
            return const Center(
              child: CircularProgressIndicator(color: Color(0xffFF8308)),
            );
          }
        },
        future:context.read<BrandsAndModelsCarsProvider>().fetchBrandsFromApi(),
      ),
    );
  }
}
