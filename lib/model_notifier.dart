import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:gigmate/models/solo_musician.dart';

enum ProType { session, producer, mixing, all }
enum MusicianType { band, soloist }

class ModelNotifier with ChangeNotifier {
  ProType proType = ProType.all;
  MusicianType musicianType = MusicianType.soloist;

  List<SoloMusician> _soloMusicianList = [];
  SoloMusician _currentSoloMusician;

  UnmodifiableListView<SoloMusician> get soloMusicianList =>
      UnmodifiableListView(_soloMusicianList);

  SoloMusician get currentSoloMusician => _currentSoloMusician;

  set soloMusicianList(List<SoloMusician> list) {
    _soloMusicianList = list;
    notifyListeners();
  }

  set currentSoloMusician(SoloMusician soloMusician) {
    _currentSoloMusician = soloMusician;
    notifyListeners();
  }
}
