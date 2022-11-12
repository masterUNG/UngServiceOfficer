// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/widgets/widget_image.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';
import 'package:ungserviceofficer/widgets/widget_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void normalDialog({required String title, required String detail}) {
    Get.dialog(
      AlertDialog(
        icon: const WidgetImage(
          size: 100,
        ),
        title: WidgetText(
          text: title,
          textStyle: MyConstant().h2Style(),
        ),
        content: WidgetText(text: detail),
        actions: [
          WidgetTextButton(
            label: 'OK',
            pressFunc: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
