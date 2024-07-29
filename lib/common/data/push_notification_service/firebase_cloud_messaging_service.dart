import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseCloudMessagingService {
  static final _firebase = FirebaseMessaging.instance;

  void init() async {
    final result = await _firebase.requestPermission();
    final token = await _firebase.getToken();
    
    debugPrint('Token : $token');
    debugPrint('Authorization status : ${result.authorizationStatus}');
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessage.listen((event) {
      debugPrint('dapat foreground message');
    });
  }

  static const _dosenPerizinanAbsensiTopic = 'dosen_perizinan_absensi';
  Future<void> subscribeToDosenPerizinanAbsensiTopic({required String nip}) async {
    await _firebase.subscribeToTopic('${_dosenPerizinanAbsensiTopic}_$nip');
  }

  Future<void> unsubscribeToDosenPerizinanAbsensiTopic({required String nip}) async {
    await _firebase.unsubscribeFromTopic('${_dosenPerizinanAbsensiTopic}_$nip');
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint('HAI HAI HAI, dapat background message!');
}