import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../injection_container.dart';
import '../../../../Home/presentation/manager/HomeProvider.dart';
import '../../../../Home/presentation/pages/HomePage/explorePage.dart';

class LoginIconButton extends StatefulWidget {
  String iconLink;
  Function onPressed;
  LoginIconButton({required this.iconLink,required this.onPressed});
  @override
  _LoginIconButtonState createState() => _LoginIconButtonState();
}

class _LoginIconButtonState extends State<LoginIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      widget.onPressed();
    }, icon: Image.network(widget.iconLink));
  }
}