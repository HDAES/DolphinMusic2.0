import 'package:flutter/material.dart';
import 'package:dolphinmusic/model/model.dart';
class PlayListProvider  with ChangeNotifier {
  MineSongListModel playlist;

  void setPlaylist(MineSongListModel newlaylist){
    playlist = newlaylist;
    notifyListeners();
  }

  MineSongListModel getPlayList(){
    return playlist;
  }
}