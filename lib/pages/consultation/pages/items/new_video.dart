// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
//
// class YouTubePlayerPage extends StatefulWidget {
//   const YouTubePlayerPage({super.key, required this.videoUrl});
//   final String videoUrl;
//
//   @override
//   State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
// }
//
// class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
//   late YoutubePlayerController _controller;
//
//   String extractVideoIdFromIframe(String iframeHtml) {
//     final regex = RegExp(r'src="https:\/\/www\.youtube\.com\/embed\/([a-zA-Z0-9_-]+)');
//     final match = regex.firstMatch(iframeHtml);
//     return match != null ? match.group(1)! : '';
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     final videoId = extractVideoIdFromIframe(widget.videoUrl);
//
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//         enableCaption: false,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(controller: _controller),
//       builder: (context, player) {
//         return Scaffold(
//           appBar: AppBar(title: const Text("YouTube Video")),
//           body: Column(
//             children: [
//               player,
//               const SizedBox(height: 20),
//               const Text("Quyida YouTube video o‘ynalmoqda"),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerPage extends StatefulWidget {
  const YouTubePlayerPage({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  late YoutubePlayerController _controller;

  String extractVideoIdFromIframe(String iframeHtml) {
    final regex = RegExp(r'src="https:\/\/www\.youtube\.com\/embed\/([a-zA-Z0-9_-]+)');
    final match = regex.firstMatch(iframeHtml);
    return match != null ? match.group(1)! : '';
  }

  @override
  void initState() {
    super.initState();

    final videoId = extractVideoIdFromIframe(widget.videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false, // 👈 Subtitrlarsiz
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("YouTube Video")),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              const SizedBox(width: 8.0),
              CurrentPosition(),
              const SizedBox(width: 8.0),
              ProgressBar(isExpanded: true),
              const SizedBox(width: 8.0),
              // PlaybackSpeedButton(),
              // ❌ FullScreenButton() ni qo‘shmaymiz
            ],
          ),
        ],
      ),
    );
  }
}

