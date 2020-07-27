import 'package:dolphinmusic/model/model.dart';
import 'package:flutter/material.dart';

class DjProvider with ChangeNotifier {

  DjSortModel djSort;

  void setDjSort(DjSortModel newdjSort){
    djSort = newdjSort;
    notifyListeners();
  }

  DjSortModel getDjSort(){
    return djSort;
  }

}