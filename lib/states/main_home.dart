import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungserviceofficer/states/login.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/utility/my_dialog.dart';
import 'package:ungserviceofficer/widgets/widget_icon_button.dart';
import 'package:ungserviceofficer/widgets/widget_image.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var pathImages = <String>[
    'images/qr.png',
    'images/visti.png',
    'images/queue.png',
  ];

  var titles = <String>[
    'อ่าน QRcode',
    'ไปเยี่ยม',
    'จองคิว',
  ];

  var pages = <String>[
    '/readQR',
    '/visit',
    '/queue',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.bgColor,
      appBar: mainAppBar(context: context),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: titles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              print('you tab index = $index');
              Get.toNamed(pages[index]);
            },
            child: Container(
              decoration: MyConstant().curveBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetImage(
                    path: pathImages[index],
                    size: boxConstraints.maxWidth * 0.25,
                  ),
                  WidgetText(
                    text: titles[index],
                    textStyle: MyConstant().h2Style(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  AppBar mainAppBar({required BuildContext context}) {
    return AppBar(
      title: WidgetText(
        text: 'Main Home',
        textStyle: MyConstant().h2Style(),
      ),
      actions: [
        WidgetIconButton(
          iconData: Icons.exit_to_app,
          pressFunc: () {
            MyDialog(context: context).normalDialog(
              title: 'Sign Out ?',
              detail: 'Please Confirm SignOut',
              label: 'Confirm',
              activeFunc: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.clear().then((value) {
                  Get.off(const Login());
                });
              },
            );
          },
        )
      ],
    );
  }
}
