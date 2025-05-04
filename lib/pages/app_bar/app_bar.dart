import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:provider/provider.dart';
import '../../constants/app_icons.dart';
import '../consultation/pages/widgets/consultation_drawer.dart';
import '../consultation/view_model/chat_view_model.dart';
import '../consultation/view_model/consultation_view_model.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key, required this.child});
  final Widget child;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom>
    with SingleTickerProviderStateMixin {
  late ConsultationViewModel consultationViewModel;

  @override
  void initState() {
    consultationViewModel = context.read<ConsultationViewModel>();
    consultationViewModel.motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final readChat = context.read<ChatViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    final watchChat = context.watch<ChatViewModel>();
    return Scaffold(
      backgroundColor: context.color.background1,
      key: read.key,
      appBar: AppBar(
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icLogo),
              5.wGap,
              Column(
                children: [
                  3.hGap,
                  GestureDetector(
                    onTap: () {
                      // getIt.get<ConsultationRepo>().postUser();
                    },
                    child: Text(
                      'позитолк',
                      style: context.textStyle.s16w400.copyWith(fontSize: 17.5),
                    ),
                  ),
                  // Text('Психотерапия brbhr', style: GoogleFonts.leckerliOne(color: context.color.primary)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              read.onSettings(context);
              readChat.isMessageOpen = false;
            },
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.color.background1,
              ),
              child: Transform.scale(
                scale: 0.55,
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    watch.drawerItem[7]
                        ? context.color.primary
                        : context.color.textBA,
                    BlendMode.srcIn,
                  ),
                  AppIcons.icSettings,
                  fit: BoxFit.contain,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),
          ),
          8.wGap,
          GestureDetector(
            onTap: () {
              read.key.currentState!.openEndDrawer();
            },
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.color.background1,
              ),
              child: Transform.scale(
                scale: 0.55,
                child: SvgPicture.asset(
                  AppIcons.icDrawer,
                  fit: BoxFit.contain,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),
          ),
          16.wGap
        ],
      ),
      endDrawer: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 450,
          child: Drawer(
              shape: ContinuousRectangleBorder(),
              backgroundColor: context.color.background2,
              width: context.width,
              child: ConsultationDrawer()),
        ),
      ),
      body: widget.child,
      // body: TabBarView(
      //   physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
      //   controller: read.motionTabBarController,
      //   children: <Widget>[
      //     // widget.child,
      //     ConsultationPage(),
      //     PsychologistSettingsUi(),
      //     ConsultationHelpUi(),
      //     ConsultationChatUi(),
      //     NavigationDefault(),
      //     // MainPageContentComponent(title: "Dashboard Page", controller: read.motionTabBarController!),
      //     // MainPageContentComponent(title: "Home Page", controller: read.motionTabBarController!),
      //     // MainPageContentComponent(title: "Profile Page", controller: read.motionTabBarController!),
      //     // MainPageContentComponent(title: "Settings Page", controller: read.motionTabBarController!),
      //     // MainPageContentComponent(title: "Settings Page", controller: read.motionTabBarController!),
      //   ],
      // ),
      // );
      bottomNavigationBar: watchChat.isMessageOpen
          ? const SizedBox.shrink()
          : MotionTabBar(
              controller: read
                  .motionTabBarController, // ADD THIS if you need to change your tab programmatically
              initialSelectedTab: read.selectNavigation,
              // initialSelectedTab: ' ',
              useSafeArea: true, // default: true, apply safe area wrapper
              // labelAlwaysVisible: true, // default: false, set to "true" if you need to always show labels
              labels: const [
                "Клиенты",
                "Статистика",
                "Расписание",
                "Чаты",
                'Настройки'
              ],

              //// use default icon (with IconData)
              // icons: const [
              //   Icons.dashboard,
              //   Icons.home,
              //   Icons.people_alt,
              //   Icons.settings,
              // ],

              // use custom widget as display Icon
              iconWidgets: [
                SvgPicture.asset(
                  AppIcons.icUsers,
                  colorFilter: ColorFilter.mode(
                    context.color.background2,
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.icStatistics,
                  colorFilter: ColorFilter.mode(
                    context.color.background2,
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.icWhiteLogo,
                  width: 24,
                  height: 24,
                ),
                SvgPicture.asset(
                  AppIcons.icNavigationChat,
                ),
                SvgPicture.asset(
                  AppIcons.icSettings,
                  colorFilter: ColorFilter.mode(
                    context.color.background2,
                    BlendMode.srcIn,
                  ),
                ),
              ],

              // optional badges, length must be same with labels
              badges: [
                null,
                // Default Motion Badge Widget
                // const MotionBadgeWidget(
                //   text: '99+',
                //   textColor: Colors.white, // optional, default to Colors.white
                //   color: Colors.blue, // optional, default to Colors.red
                //   size: 18, // optional, default to 18
                // ),

                // custom badge Widget
                // Container(
                //   color: Colors.black,
                //   padding: const EdgeInsets.all(2),
                //   child: const Text(
                //     '48',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                null,
                null,
                // allow null
                null,
                null,
                // Default Motion Badge Widget with indicator only
                // const MotionBadgeWidget(
                //   isIndicator: true,
                //   color: Colors.blue, // optional, default to Colors.red
                //   size: 5, // optional, default to 5,
                //   show: true, // true / false
                // ),
              ],
              tabSize: 50,
              tabBarHeight: 55,
              textStyle: TextStyle(
                fontSize: 8,
                color: context.color.background2,
                fontWeight: FontWeight.w500,
              ),
              // tabIconColor: Colors.blue[600],
              tabIconSize: 28.0,
              tabIconSelectedSize: 32.0,
              tabIconColor: context.color.background2,
              tabSelectedColor: context.color.primary,
              tabIconSelectedColor: Colors.black,
              tabBarColor: context.color.primary,
              onTabItemSelected: (int value) {
                print(value);

                read.motionTabBarController!.index = value;
                if (read.motionTabBarController!.index == 0) {
                  read.onDrawerSelected(context, 2);
                }
                if (read.motionTabBarController!.index == 1) {
                  read.onDrawerSelected(context, 4);
                }
                if (read.motionTabBarController!.index == 2) {
                  read.onDrawerSelected(context, 0);
                }
                if (read.motionTabBarController!.index == 3) {
                  // await readChat.getChatList();
                  //   context.go(RouteNames.consultationChat);
                  //   read.drawerItem = List.generate(8, (index) => false);
                  //   read.drawerItem[1] = true;
                  read.onDrawerSelected(context, 1);
                }
                if (read.motionTabBarController!.index == 4) {
                  read.onDrawerSelected(context, 7);
                }

                read.onSetState();
                setState(() {});
              },
            ),
    );
  }
}
