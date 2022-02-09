import 'package:cloud_firestore/cloud_firestore.dart';

import 'live_band.dart';
import '../providers/model_notifier.dart';
import 'producer.dart';
import 'solo_musician.dart';

class ModelApi {
  getSoloMusicians(ModelNotifier modelNotifier) async {
    FirebaseFirestore rootRef = FirebaseFirestore.instance;
    rootRef.settings = Settings(persistenceEnabled: true);
    rootRef.snapshotsInSync();
    QuerySnapshot snapshot = await rootRef.collection('soloMusician').get();

    List<SoloMusician> _soloists = [];
    snapshot.docs.forEach((document) {
      SoloMusician soloMusician = SoloMusician.fromMap(document.data());
      _soloists.add(soloMusician);
    });
    if (snapshot.metadata.isFromCache) {
      print('YES! YES! I AM FROM CACHE');
    }
    modelNotifier.soloMusicianList = _soloists;
  }

  getLiveBands(ModelNotifier modelNotifier) async {
    FirebaseFirestore rootRef = FirebaseFirestore.instance;
    rootRef.settings = Settings(persistenceEnabled: true);
    rootRef.snapshotsInSync();
    QuerySnapshot snapshot = await rootRef.collection('livebands').get();

    List<LiveBand> _bands = [];
    snapshot.docs.forEach((document) {
      LiveBand liveBand = LiveBand.fromMap(document.data());
      _bands.add(liveBand);
    });
    if (snapshot.metadata.isFromCache) {
      print('LIVE BAND! I AM FROM CACHE');
    }
    modelNotifier.liveBandList = _bands;
  }

  getProducers(ModelNotifier modelNotifier) async {
    FirebaseFirestore rootRef = FirebaseFirestore.instance;
    rootRef.settings = Settings(persistenceEnabled: true);
    rootRef.snapshotsInSync();
    QuerySnapshot snapshot = await rootRef.collection('producers').get();

    List<Producer> _producers = [];
    snapshot.docs.forEach((document) {
      Producer producer = Producer.fromMap(document.data());
      _producers.add(producer);
    });
    if (snapshot.metadata.isFromCache) {
      print('PRODUCER! I AM FROM CACHE');
    }
    modelNotifier.producersList = _producers;
  }
}
