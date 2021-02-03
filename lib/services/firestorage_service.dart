import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  static Future getImage(BuildContext context, String imageName) async {
    Image imageUrl;
    await FireStorageService.loadImage(context, imageName).then((value) {
      imageUrl = Image.network(
        value.toString(),
        fit: BoxFit.cover,
      );
    });
    return imageUrl;
  }
}
