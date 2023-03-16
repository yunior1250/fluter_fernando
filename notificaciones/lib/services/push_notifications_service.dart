//6C:C1:E2:99:F2:87:64:50:90:CA:9D:32:FE:32:BC:36:D4:6F:52:D2

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    //Local notifiations
    token = await FirebaseMessaging.instance.getToken();
    print(token);
  }
}
