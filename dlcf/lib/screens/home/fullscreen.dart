import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


YoutubePlayerBuilder(
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
          _controller.load(
              widget.vidUrl); // Add your desired video ID to loop the video
        },
      ),
    builder: (context, player){
        return Column(
            children: [
                // some widgets
                player,
                //some other widgets
            ],
        );
    ),
),