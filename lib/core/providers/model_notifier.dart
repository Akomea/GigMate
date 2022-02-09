import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:gigmate/core/models/producer.dart';
import 'package:gigmate/core/models/solo_musician.dart';

import '../models/live_band.dart';

enum ProType { session, producer, mixing, all }
enum MusicianType { band, soloist }

class ModelNotifier with ChangeNotifier {
  ProType proType = ProType.all;
  MusicianType musicianType = MusicianType.soloist;

  /*** SOLO MUSICIANS ***/

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

  /*** LIVE BAND ***/

  List<LiveBand> _liveBandList = [];
  LiveBand _currentLiveBand;

  UnmodifiableListView<LiveBand> get liveBandList =>
      UnmodifiableListView(_liveBandList);

  LiveBand get currentLiveBand => _currentLiveBand;

  set liveBandList(List<LiveBand> list) {
    _liveBandList = list;
    notifyListeners();
  }

  set currentLiveBand(LiveBand liveBand) {
    _currentLiveBand = liveBand;
    notifyListeners();
  }

  /*** PRODUCERS ***/

  List<Producer> _producersList = [];
  Producer _currentProducer;

  UnmodifiableListView<Producer> get producersList =>
      UnmodifiableListView(_producersList);

  Producer get currentProducer => _currentProducer;

  set producersList(List<Producer> list) {
    _producersList = list;
    notifyListeners();
  }

  set currentProducersList(Producer producer) {
    _currentProducer = producer;
    notifyListeners();
  }
}
