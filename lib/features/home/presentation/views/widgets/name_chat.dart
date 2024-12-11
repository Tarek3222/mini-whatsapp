import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameChat extends StatelessWidget {
  const NameChat({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
