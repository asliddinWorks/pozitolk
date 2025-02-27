import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu, size: 24,), padding: EdgeInsets.symmetric(horizontal: 20),),
        ],
        title: Row(
          children: [
            SvgPicture.asset(AppIcons.icLogo),
            5.wGap,
            Text('позитолк', style: context.textStyle.s16w400),
          ],
        )
      ),
      body: Center(
        child: Text('позитолк'),
      ),
    );
  }
}
