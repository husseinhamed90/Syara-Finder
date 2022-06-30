import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/Componantes.dart';
import '../../../../BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import '../../../../BrandsAndModelsAndCars/presentation/pages/BrandsPage/brandsPage.dart';
import '../../../../BrandsAndModelsAndCars/presentation/pages/ModelsPage/modelsPage.dart';

class LeftOrRightSection extends StatefulWidget {
  bool isClickable=true;
  LeftOrRightSection({
    Key? key,
    required this.isClickable
  }) : super(key: key);

  @override
  State<LeftOrRightSection> createState() => _LeftOrRightSectionState();
}
class _LeftOrRightSectionState extends State<LeftOrRightSection> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildSection(title: "Brand",subTitle: (context.watch<BrandsAndModelsCarsProvider>().currentBrand.brandName!=null)?context.watch<BrandsAndModelsCarsProvider>().currentBrand.brandName:"No Brand Selected",context: context,nextPage: brandsPage(),isClickable: widget.isClickable),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                    height: 52.h,
                    width: 2,
                    color: const Color(0xff959595),
                  ),
                  buildSection(title: "Model",subTitle:(context.watch<BrandsAndModelsCarsProvider>().selectedModel!=null)?context.watch<BrandsAndModelsCarsProvider>().selectedModel!.modelName:"No Model Selected"  ,context: context,nextPage: modelsPage(),isClickable: widget.isClickable),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}