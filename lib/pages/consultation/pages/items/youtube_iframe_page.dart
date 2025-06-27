// import 'package:flutter/material.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
// class YouTubeIframePage extends StatefulWidget {
//   final String iframeHtml;
//
//   const YouTubeIframePage({super.key, required this.iframeHtml});
//
//   @override
//   State<YouTubeIframePage> createState() => _YouTubeIframePageState();
// }
//
// class _YouTubeIframePageState extends State<YouTubeIframePage> {
//   late final YoutubePlayerController _controller;
//
//   String? extractVideoId(String iframe) {
//     final RegExp regExp = RegExp(
//       r'src="https:\/\/www\.youtube\.com\/embed\/([^"?&]+)',
//     );
//     final match = regExp.firstMatch(iframe);
//     return match?.group(1);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final videoId = extractVideoId(widget.iframeHtml);
//     if (videoId == null) {
//       throw Exception('Video ID topilmadi');
//     }
//
//     _controller = YoutubePlayerController.fromVideoId(
//       videoId: videoId,
//       autoPlay: false,
//       params: const YoutubePlayerParams(
//         showFullscreenButton: true,
//         showControls: true,
//         enableCaption: true,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerScaffold(
//       controller: _controller,
//       builder: (context, player) {
//         return Scaffold(
//           appBar: AppBar(title: const Text('YouTube iframe video')),
//           body: Center(child: player),
//         );
//       },
//     );
//   }
// }

// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/cupertino.dart';
// import 'package:pozitolk/core/extension/context_extension.dart';
// import 'package:pozitolk/core/extension/num_extension.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
// import '../../data/models/event_model.dart';
//
// class EventItemVideo2 extends StatefulWidget {
//   const EventItemVideo2({super.key, required this.eventVideoModel});
//   final EventVideoModel eventVideoModel;
//
//   @override
//   State<EventItemVideo2> createState() => _EventItemVideo2State();
// }
//
// class _EventItemVideo2State extends State<EventItemVideo2> {
//   late YoutubePlayerController controller;
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
//     controller = YoutubePlayerController(
//         params: const YoutubePlayerParams(
//           showControls: true,
//           showFullscreenButton: true,
//         ),
//       )..loadVideoById(videoId: extractVideoIdFromIframe(widget.eventVideoModel.source));
//   }
//
//   @override
//   void dispose() {
//     controller.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 230,
//       width: 240,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 140,
//             width: 180,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               color: context.color.background1,
//             ),
//             child: YoutubePlayerScaffold(
//               controller: controller,
//               aspectRatio: 16 / 9,
//               builder: (context, player) {
//                 return Column(
//                   children: [
//                     player,
//                     const Text('Youtube Player'),
//                   ],
//                 );
//               },
//             ),
//           ),
//           16.hGap,
//           Text(
//             widget.eventVideoModel.type,
//             style: context.textStyle.s16w600Manrope.copyWith(
//               fontSize: 12,
//               color: const Color(0xFFA7ACAF),
//             ),
//           ),
//           2.hGap,
//           Text(
//             widget.eventVideoModel.title,
//             style: context.textStyle.s16w600Manrope,
//           ),
//           8.hGap,
//           Text(
//             widget.eventVideoModel.description,
//             style: context.textStyle.s14w500Manrope,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pozitolk/pages/consultation/view_model/client_view_model.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeTestPage extends StatefulWidget {
  const YouTubeTestPage({super.key, required this.source});
  final String source;

  @override
  State<YouTubeTestPage> createState() => _YouTubeTestPageState();
}

class _YouTubeTestPageState extends State<YouTubeTestPage> {
  late YoutubePlayerController _controller;
  late ClientViewModel read;

  String extractVideoIdFromIframe(String iframe) {
    final regex = RegExp(r'youtube\.com\/embed\/([a-zA-Z0-9_-]+)');
    final match = regex.firstMatch(iframe);
    return match?.group(1) ?? '';
  }

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      read = context.read<ClientViewModel>();
      // final source = read.eventsVideoList[0].source;
      // final videoId = YoutubePlayerController.convertUrlToId(source) ?? 'U5pw9UbBX-k';
      // print('Video ID: $videoId');

      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: false,
          enableCaption: false,
        ),
      )..cueVideoById(videoId: extractVideoIdFromIframe(widget.source));

      // _controller.play();
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Column(
          mainAxisSize: MainAxisSize.min, // <-- Kichik joyda siqilmasligi uchun
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: player,
                ),
              ],
            ),
            // Qo‘shimcha widgetlar istasangiz shu yerga yozasiz
          ],
        );
      },
    );
  }
}
