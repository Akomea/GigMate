import 'package:cloud_firestore/cloud_firestore.dart';

import 'model_notifier.dart';
import 'models/rating.dart';
import 'models/solo_musician.dart';

class ModelApi {
  getSoloMusicians(ModelNotifier modelNotifier) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('soloMusician').get();

    FirebaseFirestore rootRef = FirebaseFirestore.instance;
    CollectionReference soloMusicianRef = rootRef.collection("soloMusicians");
    DocumentReference applicationIdRef =
        soloMusicianRef.doc(soloMusicianRef.id);

    DocumentSnapshot documentSnapshot;

    List<SoloMusician> _soloists = [];
    List<Rating> _ratings = [];
    snapshot.docs.forEach((document) {
      SoloMusician soloMusician = SoloMusician.fromMap(document.data());
      // _ratings = documentSnapshot['reviews'].map<Rating>((item) {
      //   return Rating.fromMap(item);
      // }).toList();
      _soloists.add(soloMusician);
    });

    modelNotifier.soloMusicianList = _soloists;
  }

  getReviews(ModelNotifier modelNotifier) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('soloMusician').get();
    List<SoloMusician> _soloists = [];

    snapshot.docs.forEach((document) {
      SoloMusician soloMusician = SoloMusician.fromMap(document.data());
      _soloists.add(soloMusician);
    });

    modelNotifier.soloMusicianList = _soloists;
  }
}
