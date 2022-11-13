import 'package:flutter/material.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class Queue extends StatelessWidget {
  const Queue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: WidgetText(text: 'จองคิว', textStyle: MyConstant().h2Style(),),),);
  }
}