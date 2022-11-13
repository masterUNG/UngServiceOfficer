import 'package:flutter/material.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class ReadQR extends StatelessWidget {
  const ReadQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(
          text: 'Read QR code',
          textStyle: MyConstant().h2Style(),
        ),
      ),
    );
  }
}
