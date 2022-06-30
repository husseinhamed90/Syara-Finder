import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    }, icon: CachedNetworkImage(imageUrl: widget.iconLink,));
  }
}