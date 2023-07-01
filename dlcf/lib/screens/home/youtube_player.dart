import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MessagePlayer extends StatefulWidget {
  final String vidUrl;
  final bool isLive;
  final String videoID;
  const MessagePlayer({
    super.key,
    required this.vidUrl,
    this.isLive = false,
    this.videoID = "",
  });

  @override
  // ignore: library_private_types_in_public_api
  _MessagePlayerState createState() => _MessagePlayerState();
}

class _MessagePlayerState extends State<MessagePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.isLive ? widget.videoID : widget.vidUrl,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        isLive: widget.isLive,
        mute: false,
        enableCaption: false,
        showLiveFullscreenButton: false,
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
    return Center(
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              // ignore: avoid_print
              print('Player is ready.');
            },
            onEnded: (metadata) {
              final nextPage = widget.isLive ? widget.videoID : widget.vidUrl;
              _controller.load(nextPage); // loops this video
            },
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
              ],
            );
          }),
    );
  }
}
