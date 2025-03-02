import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/home/pages/widgets/advantages_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/collaborate_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/to_help.dart';
import 'package:pozitolk/pages/home/pages/widgets/app_drawer.dart';
import 'package:pozitolk/pages/home/pages/widgets/start_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: context.color.background1,
        width: context.width,
        child: SafeArea(
          child: AppDrawer(),
        ),
      ),
      backgroundColor: context.color.background1,
      appBar: AppBar(
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor: context.color.background1,
        actions: [
          IconButton(
            onPressed: () {
              _key.currentState!.openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 24,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
        title: Row(
          children: [
            SvgPicture.asset(AppIcons.icLogo),
            5.wGap,
            Text('позитолк', style: context.textStyle.s16w400),
          ],
        ),
      ),
      body: ListView(
        children: [
          StartHome(),
          130.hGap,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: context.color.background2,
            ),
            child: Column(
              children: [
                ToHelp(),
                Text(
                  'Преимущества позитивной и транскультуральной психотерапии',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                AdvantagesUi(),
                60.hGap,
                Text(
                  'Работаем только с проверенными психологами',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                CollaborateUi(),
                60.hGap,
                Text(
                  'ПозиТолк делает психотерапию удобной и доступной',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                AdvantagesUi(),
                60.hGap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
