import 'package:cloud_firestore/cloud_firestore.dart';

import 'model_notifier.dart';
import 'models/solo_musician.dart';

class ModelApi {
  getSoloMusicians(ModelNotifier modelNotifier) async {
    FirebaseFirestore rootRef = FirebaseFirestore.instance;
    rootRef.settings = Settings(persistenceEnabled: true);
    rootRef.snapshotsInSync();
    QuerySnapshot snapshot = await rootRef.collection('soloMusician').get();

    List<SoloMusician> _soloists = [];
    snapshot.docs.forEach((document) {
      SoloMusician soloMusician = SoloMusician.fromMap(document.data());
      // _ratings = documentSnapshot['reviews'].map<Rating>((item) {
      //   return Rating.fromMap(item);
      // }).toList();
      _soloists.add(soloMusician);
    });
    if (snapshot.metadata.isFromCache) {
      print('YES! YES! I AM FROM CACHE');
    }
    modelNotifier.soloMusicianList = _soloists;
  }

  // getReviews(ModelNotifier modelNotifier) async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('soloMusician').get();
  //   List<SoloMusician> _soloists = [];
  //
  //   snapshot.docs.forEach((document) {
  //     SoloMusician soloMusician = SoloMusician.fromMap(document.data());
  //     _soloists.add(soloMusician);
  //   });
  //
  //   modelNotifier.soloMusicianList = _soloists;
  // }
}
