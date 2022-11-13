import 'package:flutter/material.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class Visit extends StatelessWidget {
  const Visit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: WidgetText(text: 'ไปเยี่ยม', textStyle: MyConstant().h2Style(),),),);
  }
}