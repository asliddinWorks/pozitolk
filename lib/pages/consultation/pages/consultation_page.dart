import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage>with SingleTickerProviderStateMixin {
  late ConsultationViewModel consultationViewModel;
  @override
  void initState() {
    consultationViewModel = context.read<ConsultationViewModel>();
    // consultationViewModel.motionTabBarController = MotionTabBarController(
    //   initialIndex: 1,
    //   length: 5,
    //   vsync: this,
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      // await Future.delayed(Duration(milliseconds: !mounted ? 0 : 400),);
      if (!mounted) return;
      await context.read<ConsultationViewModel>().getUser();
      if (!mounted) return;
      await context.read<ConsultationViewModel>().getTable();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final read = context.read<ConsultationViewModel>();
    // final readChat = context.read<ChatViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    // final watchChat = context.watch<ChatViewModel>();
    return Scaffold(
      backgroundColor: context.color.background1,
      body: Center(),
      // key: read.key,
      // appBar: AppBar(
      //   toolbarHeight: 56,
      //   automaticallyImplyLeading: false,
      //   title: SafeArea(
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SvgPicture.asset(AppIcons.icLogo),
      //         5.wGap,
      //         Column(
      //           children: [
      //             3.hGap,
      //             GestureDetector(
      //               onTap: (){
      //                 // getIt.get<ConsultationRepo>().postUser();
      //               },
      //               child: Text(
      //                 'позитолк',
      //                 style: context.textStyle.s16w400.copyWith(fontSize: 17.5),
      //               ),
      //             ),
      //             // Text('Психотерапия brbhr', style: GoogleFonts.leckerliOne(color: context.color.primary)),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         read.onSettings();
      //         readChat.isMessageOpen = false;
      //       },
      //       child: Container(
      //         // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      //         width: 36,
      //         height: 36,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(16),
      //           color: context.color.background1,
      //         ),
      //         child: Transform.scale(
      //           scale: 0.55,
      //           child: SvgPicture.asset(
      //             colorFilter: ColorFilter.mode(
      //               watch.drawerItem[7] ? context.color.primary : context.color.textBA,
      //               BlendMode.srcIn,
      //             ),
      //             AppIcons.icSettings,
      //             fit: BoxFit.contain,
      //             allowDrawingOutsideViewBox: true,
      //           ),
      //         ),
      //       ),
      //     ),
      //     8.wGap,
      //     GestureDetector(
      //       onTap: () {
      //         read.key.currentState!.openEndDrawer();
      //       },
      //       child: Container(
      //         // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      //         width: 36,
      //         height: 36,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(16),
      //           color: context.color.background1,
      //         ),
      //         child: Transform.scale(
      //           scale: 0.55,
      //           child: SvgPicture.asset(
      //             AppIcons.icDrawer,
      //             fit: BoxFit.contain,
      //             allowDrawingOutsideViewBox: true,
      //           ),
      //         ),
      //       ),
      //     ),
      //     16.wGap
      //   ],
      // ),
      // endDrawer: Align(
      //   alignment: Alignment.topCenter,
      //   child: SizedBox(
      //     height: 450,
      //     child: Drawer(
      //       shape: ContinuousRectangleBorder(),
      //       backgroundColor: context.color.background2,
      //       width: context.width,
      //       child: ConsultationDrawer()
      //     ),
      //   ),
      // ),
      // body: watchChat.isMessageOpen ? MessageUi(chatModel: watchChat.chatModel) : ListView(
      //   physics: watch.drawerItem[1] ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
      //   children: [
      //     // watchChat.isMessageOpen ? MessageUi(chatModel: watchChat.chatModel) : SizedBox.shrink(),
      //     watch.drawerItem[1] && !watchChat.isMessageOpen ? ConsultationChatUi() : SizedBox.shrink(),
      //     watch.drawerItem[6] ? ConsultationHelpUi(): SizedBox.shrink(),
      //     watch.drawerItem[7] ? PsychologistSettingsUi() : SizedBox.shrink(),
      //   ],
      // ),
      // bottomNavigationBar: watchChat.isMessageOpen ? const SizedBox.shrink() : MotionTabBar(
      //   controller: read.motionTabBarController, // ADD THIS if you need to change your tab programmatically
      //   // initialSelectedTab: " ",
      //   initialSelectedTab: ' ',
      //   useSafeArea: true, // default: true, apply safe area wrapper
      //   // labelAlwaysVisible: true, // default: false, set to "true" if you need to always show labels
      //   labels: const ["Главная", "Личный кабинет", " ", "ИИ-чат", 'Календарь'],
      //
      //   //// use default icon (with IconData)
      //   // icons: const [
      //   //   Icons.dashboard,
      //   //   Icons.home,
      //   //   Icons.people_alt,
      //   //   Icons.settings,
      //   // ],
      //
      //   // use custom widget as display Icon
      //   iconWidgets: [
      //     SvgPicture.asset(AppIcons.icHome),
      //     SvgPicture.asset(AppIcons.icUser),
      //     SvgPicture.asset(AppIcons.icWhiteLogo, width: 24, height: 24,),
      //     SvgPicture.asset(AppIcons.icNavigationChat),
      //     SvgPicture.asset(AppIcons.icNavigationCalendar),
      //   ],
      //
      //   // optional badges, length must be same with labels
      //   badges: [
      //     null,
      //     // Default Motion Badge Widget
      //     // const MotionBadgeWidget(
      //     //   // text: '99+',
      //     //   textColor: Colors.white, // optional, default to Colors.white
      //     //   color: Colors.blue, // optional, default to Colors.red
      //     //   size: 18, // optional, default to 18
      //     // ),
      //
      //     // custom badge Widget
      //     // Container(
      //     //   color: Colors.black,
      //     //   padding: const EdgeInsets.all(2),
      //     //   child: const Text(
      //     //     '48',
      //     //     style: TextStyle(
      //     //       fontSize: 14,
      //     //       color: Colors.white,
      //     //     ),
      //     //   ),
      //     // ),
      //     null,
      //     null,
      //     // allow null
      //     null,
      //     null,
      //     // Default Motion Badge Widget with indicator only
      //     // const MotionBadgeWidget(
      //     //   isIndicator: true,
      //     //   color: Colors.blue, // optional, default to Colors.red
      //     //   size: 5, // optional, default to 5,
      //     //   show: true, // true / false
      //     // ),
      //   ],
      //   tabSize: 50,
      //   tabBarHeight: 55,
      //   textStyle: TextStyle(
      //     fontSize: 12,
      //     color: context.color.background2,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   // tabIconColor: Colors.blue[600],
      //   tabIconSize: 28.0,
      //   tabIconSelectedSize: 32.0,
      //   tabSelectedColor: context.color.primary,
      //   tabIconSelectedColor: Colors.black,
      //   tabBarColor: context.color.primary,
      //   onTabItemSelected: (int value) async{
      //
      //       read.motionTabBarController!.index = value;
      //       if(read.motionTabBarController!.index == 3) {
      //         await readChat.getChatList();
      //         read.drawerItem = List.generate(8, (index) => false);
      //         read.drawerItem[1] = true;
      //       }
      //       if(read.motionTabBarController!.index == 1) {
      //         read.drawerItem = List.generate(8, (index) => false);
      //         read.drawerItem[7] = true;
      //       }
      //       setState(() {});
      //   },
      // ),

    ).loadingView(watch.isLoading);
  }
}
