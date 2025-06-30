// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
//
// class FullScreenVideoPage extends StatefulWidget {
//   const FullScreenVideoPage({super.key, required this.source});
//   final String source;
//
//   @override
//   State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
// }
//
// class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
//   late YoutubePlayerController _controller;
//
//   String extractVideoIdFromIframe(String iframe) {
//     final regex = RegExp(r'youtube\.com\/embed\/([a-zA-Z0-9_-]+)');
//     final match = regex.firstMatch(iframe);
//     return match?.group(1) ?? '';
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // 🟢 bar yo‘q
//     _controller = YoutubePlayerController(
//       params: const YoutubePlayerParams(
//         showControls: true,
//         showFullscreenButton: false,
//         enableCaption: false,
//       ),
//     )..loadVideoById(videoId: extractVideoIdFromIframe(widget.source));
//   }
//
//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // 🔄 barni tiklaydi
//     _controller.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//
//     // Ekran o'lchamlari
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//
//     // Video asl nisbatini 16:9 deb olamiz (youtube videolar uchun)
//     const videoAspectRatio = 16 / 9;
//
//     // Burilishdan keyin width va height almashadi,
//     // shuning uchun video joylashuvi uchun width=screenHeight, height=screenWidth bo'ladi
//     final videoWidth = screenHeight;
//     final videoHeight = screenWidth;
//
//     // Video uchun AspectRatio hisoblash (width/height)
//     final rotatedVideoAspectRatio = videoWidth / videoHeight;
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Center(
//             child: SizedBox(
//               width: videoWidth,
//               height: videoHeight,
//               child: Transform.rotate(
//                 angle: 1.5708, // 90 daraja
//                 child: YoutubePlayer(controller: _controller),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 32,
//             left: 16,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class FullScreenVideoPage extends StatefulWidget {
  const FullScreenVideoPage({super.key, required this.source});
  final String source;

  @override
  State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late YoutubePlayerController _controller;

  String extractVideoIdFromIframe(String iframe) {
    final regex = RegExp(r'youtube\.com\/embed\/([a-zA-Z0-9_-]+)');
    final match = regex.firstMatch(iframe);
    return match?.group(1) ?? '';
  }

  @override
  void initState() {
    super.initState();

    // Ekran orientatsiyasini faqat shu sahifada landscape ga o‘zgartiramiz
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    // Status bar va navigatsiya panelini yashiramiz (to‘liq ekran)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: false,
        enableCaption: false,
      ),
    )..loadVideoById(videoId: extractVideoIdFromIframe(widget.source));
  }

  @override
  void dispose() {
    // Sahifadan chiqishda ekran orientatsiyasini asl holatga tiklaymiz
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Status bar va navigatsiya panelini tiklaymiz
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(controller: _controller),
          ),
          Positioned(
            top: 32,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
