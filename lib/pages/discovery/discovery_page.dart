import 'package:flutter/material.dart';
import 'package:dolphinmusic/pages/discovery/discovery_banner.dart';
import 'package:dolphinmusic/pages/discovery/discovery_nav.dart';
import 'package:dolphinmusic/pages/discovery/discovery_rec_song_list.dart';
import 'package:dolphinmusic/pages/discovery/discovery_music_album.dart';
import 'package:dolphinmusic/pages/discovery/discovery_mv.dart';
class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DiscoveryBanner(),
        DiscoveryNav(),
        DiscoveryRecSongList(),
        DiscoveryMusicAlbum(),
        DiscoveryMv()
      ],
    );
  }
}