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
      "private_key_id": "e1516b04078749a237513020d295ac0573da1dbf",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4R9OzuGy3ZVEt\nZh0kT+hzXS0UIgG0zDEwUY3G1wTbBJA9HwpcafLFd/tqCEJdTEKwsn7v7PEjZ5Kn\nYA3wKG9fLBQumptEY+KYbkLR4v1WoF25TCYpgJCNx5gIcL/JOL7t1RyVN4FtNjFl\nd3gVYNCwwy1cCl0gAPwkYN63JdGMKFr9sru4yofUqVJe1o6Hif2d9a4YEf1SWUnS\nqKv4MCw0yeWrxSA7W5lOX+ngXPwuCvz+sK8cBOaZsT/X44kIIiyGVV0MYkm7P1LN\nD1fFbcDNUGpmUxJcj+0bmLsfpnPRURJ+a3cKlyPfXN8YJSZA04G2jFNeFjHApZbo\noqI7//MTAgMBAAECggEAB9XR/AG66Z9OsMn3MjyNix4qlQEPJoNKEh5dk1dAFxne\nEiM4Ow6sKlY8I9l/DN15tm6YdBYUeKdmNmSgoxXtClRi9UpQkLtYfpetkqP+lojS\nA1doBfq36rdSUQWOOf2GLLGTegq2n5Ce0Awg2HPZ27IowxGTvREdp2RRA+OBQd7A\n6pgchxD0wrM3NPR6OGbnJguqBXZqt6MaJ5bIRSs0aK8xMMOHH5D6qkpUUFfe1ZSt\nakaPz6ni6MS15cVfxiaIFtzVnTFBUNeL6seNRle7QVIHzMLdQQswlL1TVA2GwLcu\nq1ILCf8HW5pJTvbBgAR9sgHNdNdpj9lAYGoTSVxhmQKBgQDdCn2pDvlVLC2RZ0PY\nS9B68DxDU6wlwcvw0u+/rgcpUY0e55aHiTGBcT0vW+JIWt3iuUIqcXiucmX+NrTy\nHY5JfBFlnG4P0yzCCtxTXH8JsN4iwLpjQ9i97m2FpYBtnHjuRlFrGn9BGKuhzZrU\nOgQdiX/HykB4SR4g8Cow7G0FSwKBgQDVbPr/uLOtVpUG6Vys35y0P37jhUmqufTz\nsWhdV5NkMJV9aTWLC1y9NTHsetDckwx9FVbOsaZN3exuAVi1XpVVtJowq7p79AdJ\nkvrst3toU5bJqgmANF/Bz1Si/8n8oSqy2XRehtkmqDlDbG9cA/aCT1z7avbOnou2\nT7T3rcXUWQKBgHFn6IDMRfAE8nwfVxeqDhSFHOYOD8xvWYr9LjRRvSrdxGGOwBRZ\ntySKTLH3mmk09ZJVKjVMcnZOCzYaK0vtDgt1tBdF4tILrnL/z3qVgjgenlmGOBql\nvJX1tgtTlkimdwUI3szsk016stQZAM7R1TqySPTgN6N/IA4WKg9fva9xAoGBALXb\nRcjOdnO1+ghIooo/g8Rm8lUmRs4t49YejgIzVEkjyM1y74fKJ7ylbiPFxuCcgCC5\nJR28bCufdQ2LIi5xKKg92sCsI5vpJKiBkERSV9pel3bA55WRiyKW6tR1RoR4Q+zf\ns/OzzabN4vVbmUv7qHoC7ATjcOhAWmX/ZwFA1fgJAoGAU8lJ/CEaNbVIBvI6FAym\n15fKJq0kpgdOkUfrnIx6Y/XGOJ9oHIC9nymDCf9Jju/Y8X7qYVRn8Nt5XHhovSs0\n+FyEui7quhpwWQSBVmanpmSr0k5prnZJ/NdKvdgct0H82CjrpDlL76sPznuqUUuv\nE2/0Y6aNW5k3ARzj+SZ1NjE=\n-----END PRIVATE KEY-----\n",
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
