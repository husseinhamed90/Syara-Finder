import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForFilteredListPage extends StatefulWidget {

  String text;
  Color color;
  CustomTextForFilteredListPage({required this.text,required this.color});
  @override
  _CustomTextForFilteredListPageState createState() => _CustomTextForFilteredListPageState();
}

class _CustomTextForFilteredListPageState extends State<CustomTextForFilteredListPage> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,style: TextStyle(
        color: widget.color,
        fontSize: 14.sp
    ),);
  }
}
