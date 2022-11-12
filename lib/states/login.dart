import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungserviceofficer/utility/app_controller.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/utility/my_dialog.dart';
import 'package:ungserviceofficer/widgets/widget_button.dart';
import 'package:ungserviceofficer/widgets/widget_form.dart';
import 'package:ungserviceofficer/widgets/widget_icon_button.dart';
import 'package:ungserviceofficer/widgets/widget_image.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GetX(
            init: AppController(),
            builder: (AppController appController) {
              return Center(
                child: SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      newHead(boxConstraints),
                      WidgetForm(
                        hint: 'User :',
                        suffixWidget: Icon(Icons.perm_identity),
                        changeFunc: (p0) {
                          user = p0.trim();
                        },
                      ),
                      WidgetForm(
                        hint: 'Password :',
                        obscure: appController.redEye.value,
                        changeFunc: (p0) {
                          password = p0.trim();
                        },
                        suffixWidget: WidgetIconButton(
                          iconData: appController.redEye.value
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          pressFunc: () {
                            appController.redEye.value =
                                !appController.redEye.value;
                          },
                        ),
                      ),
                      Container(
                        width: 250,
                        margin: const EdgeInsets.only(top: 8),
                        child: WidgetButton(
                          label: 'Login',
                          pressFunc: () {
                            if ((user?.isEmpty ?? true) ||
                                (password?.isEmpty ?? true)) {
                              MyDialog(context: context).normalDialog(
                                  title: 'Have Space ?',
                                  detail: 'Please Fill Every Blank');
                            } else {}
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }

  Row newHead(BoxConstraints boxConstraints) {
    return Row(
      children: [
        WidgetImage(
          size: boxConstraints.maxWidth * 0.2,
        ),
        WidgetText(
          text: 'Ung Service\nOfficer',
          textStyle: MyConstant().h2Style(),
        )
      ],
    );
  }
}
