import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  String id_videos;
  PlayVideo({Key? key, required this.id_videos}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late YoutubePlayerController _controller_yt;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller_yt = YoutubePlayerController(
        // initialVideoId: 'iLnmTe5Q2Qw',
        // flags: YoutubePlayerFlags(
        //   isLive: true,

        // ),

        initialVideoId: widget.id_videos,

        // flags: YoutubePlayerFlags(
        //   autoPlay: true,
        //   mute: true,
        // ),

        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller_yt.value.isFullScreen) {
      setState(() {
        _playerState = _controller_yt.value.playerState;
        _videoMetaData = _controller_yt.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller_yt.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller_yt.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(controller: _controller_yt),
          builder: (p0, p1) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // some widgets
                  p1,
                  //some other widgets
                ],
              ),
            );
          },
        ));
  }
}
