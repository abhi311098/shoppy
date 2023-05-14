import 'package:flutter/material.dart';
import 'package:shoppy/utils/app_color.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: AppColor.PRIMARY_COLOR,
    ));
  }
}
