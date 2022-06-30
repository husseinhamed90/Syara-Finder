
//Auth
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../injection_container.dart';
import '../../../Home/presentation/manager/HomeProvider.dart';
import '../../../Home/presentation/pages/HomePage/explorePage.dart';

Container buildSkipButton(BuildContext context) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 20),
    child: TextButton(
      onPressed: () {
        dependencyInjection.get<HomeProvider>().returnNavBarToHome();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => explorePage(),));
      },
      child: Text(
          'Skip', style: TextStyle(fontWeight: FontWeight.bold,color:HexColor("#FF8308") ,fontSize: 25.sp)
      ),
    ),
  );
}
