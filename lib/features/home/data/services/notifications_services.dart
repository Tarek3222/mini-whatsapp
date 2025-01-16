import 'dart:developer';

import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationsServices {
  final firebaseMessaging = FirebaseMessaging.instance;
  late String fMToken;
  Future<void> getFirebaseMessagingToken() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await firebaseMessaging.getToken().then((token) {
      if (token != null) {
        log(token);
        fMToken = token;
        FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
        getIt.get<UserServices>().updatePushToken(token: token);
      }
    });
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "market-smart-device",
      "private_key_id": "7819b934212404eb3939dfaa2aa3c05825c0f6e7",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/u8ITCgupfAlh\nqBhTBVjF0skAC9tcANFAyRC25Atd/SwOrFYVQLU5U+j7/xk98bMHsU+t8+l3Z8b4\nrTMiuzou5h3BfNWehE5Jt90a093fTO9SCun48/8M3O7TS8fNGl2hQzl33Oabj+Wg\nW+AH5wzWWzLdRHwv2XGhvOvk+jwETF1wxjNYB/SD4sPWi6/WoOrqlkm/YnbpRIsL\nFgYMC8KME0qHdNIZMXGjk/vu2z41lB/OgEPNL7O4r4YA0AqFIOnpvkeSeQeWgRzZ\nDjBg+BkFjebF2+3vk568DUKqrCJE642/iuxmywhQ6V7sv4VvntAie+sczDO1hVrg\nnMH/92j7AgMBAAECggEAK+KVbtcvSSlHWm9nteT05z6yXAzatinHu4zqAvqacXZn\n1anzgCTR9h+zJa7Df86pPDsE8ltwVjDONZArMqlpDWAFcoqYuJIu+yeW97ODxr8s\nzfoKiL2MZMzS61Eel98PjEA/UKSisfuTQwuUcSqc4Rl5wHSS+j7KiAsecUgnYZIU\n39FdMLN1yRDIAChOed+NXnGajZQHaP0GeXw53bdRNFVneY8gNJ2+HfJEY55mXUdE\nqYLHC/691PRIUtVouTGwc26SR2Ch8Q5+Zr8D6ouZ7Lo7qDreSRTjv/b8goHlG8vn\nvNRcMiB+VoMWkLJc8q/ZkMH/uaGPlDqRFybWcYDazQKBgQD7GHAnhu2vjNx481jL\nIT/w5KzyfjTQLb4ghQbkFqTWdGYN3HhixRXNLd3IExQRqtOmVDAi5ydyeHGpZE9W\nxrgo7vobPKx02fHuPMoC8ZUPi35oFpkNUjzz+EId8hykcTRNL9PvLW/ie9dCRMuf\neqSd99J608YtMhn55PZoLKnYlQKBgQDDen1mg3MFmRvULUB7+IZfdJx3drjIaYPZ\nKbpkuw73BU/NqX/mJ9kSdvN0ooQuao3s/lH/CxYbYu9g6g4/U10UAQmnefjjbi0C\nk2bjHHiO0TBU/iYai9wgdrGCtmubqfASvCLdEC5Mdhljqcne20mrIRqPwL7xCg0o\n9bZHzDuHTwKBgQCPaVLNUKQ6itJ1hk9lnTT+6izZRzn02NtpiXD5HvHAxrRvIEfl\n6bjc+mBcYIEq4g2GRzlDBhEisSYB4Jfr8Q3H204f9lRtXPlv32plqgM/4KUu4BFE\naX8EvPtOTTUMutdranC6f5ISoja807wU9yBEVQHzQzdCIwZxEtOlhjTvzQKBgQC9\nqYQwScv5G4QPytQtNIYT6c3Cb3N8KDxgIQeTopczf3jdn97TjcglDTrL6L79Vi9c\nSal/Ht+VNNnzm0S1lonR1evrDgI5kHWlcSU7qC0kzLzrSifoS9kJuoAixiIER88C\nLn5ZJND3KQMbWureCsAghR8DaU0aC9mW60ivwu3jKwKBgQDGSyo66Lsutv1lLkN2\nWNLlKUunfg46n3DOsBSGTox3sUfHPmHIoH/4QPK7mXhzsXlOAjmVmcKwVoOmtsS8\nJaS8jXFHduWWjrJ2GKJCyCMRF8L1MJpQTeRBSnZ75Qw/5kandxKq1THcjCKyMa7n\nFxpZBenXPe3fXQQJA/CUBPyNJQ==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-29oyb@market-smart-device.iam.gserviceaccount.com",
      "client_id": "103241523576524343494",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-29oyb%40market-smart-device.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);

      client.close();
      log("Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      log("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String name,
    required String message,
    required String userId,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
        "notification": {
          "title": name,
          "body": type == "text" ? message : "Image",
          // "android_channel_id": "chats"
        },
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "name": name,
          "id": "User Id: $userId",
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  Future<void> sendNotifications({
    required String fcmToken,
    required String name,
    required String message,
    required String userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/market-smart-device/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          fcmToken: fcmToken,
          name: name,
          message: message,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');
    } catch (e) {
      log("Error sending notification: $e");
    }
  }
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  log('title: ${message.notification?.title}');
  log('body: ${message.notification?.body}');
  log('payload: ${message.data}');
}
