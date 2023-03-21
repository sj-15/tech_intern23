// import 'dart:io';
// import 'dart:typed_data';
// import 'package:googleapis/drive/v3.dart' as ga;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as p;
// import 'package:tashveer/services/secure_storage.dart';
// import 'package:url_launcher/url_launcher.dart';

// const _clientId =
//     "286307905757-udla5h4m17t51dlcvlrgevg0m61isg8l.apps.googleusercontent.com";
// const _clientSecret = "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";
// const _scopes = [ga.DriveApi.driveFileScope];

// class GoogleDrive {
//   final storage = SecureStorage();

//   // Get Authenticated Http Client
//   Future<http.Client> getHttpClient() async {
//     // Get Credentials
//     var credentials = await storage.getCredentials();
//     if (credentials == null) {
//       // Needs user authentication
//       var authClient = await clientViaUserConsent(
//           ClientId(_clientId, _clientSecret), _scopes, (url) {
//         // Open Url in Browser
//         launch(url);
//       });
//       // Save Credentials
//       await storage.saveCredentials(authClient.credentials.accessToken,
//           authClient.credentials.refreshToken!);
//       return authClient;
//     } else {
//       // Already authenticated
//       return authenticatedClient(
//           http.Client(),
//           AccessCredentials(
//               AccessToken(credentials["type"] ?? '', credentials["data"] ?? '',
//                   DateTime.tryParse(credentials["expiry"]!)!.toUtc()),
//               credentials["refreshToken"],
//               _scopes));
//     }
//   }

//   Future<void> upload(File file, Uint8List bytes) async {
//     var client = await getHttpClient();
//     var drive = ga.DriveApi(client);
//     print("Uploading file");
//     var response = await drive.files.create(
//         ga.File()..name = p.basename(file.absolute.path),
//         uploadMedia: ga.Media(Stream.fromIterable([bytes]), bytes.length));
//     if (response.statusCode == 200) {
//       print("Upload successful");
//     } else {
//       print("Upload failed");
//     }
//   }

//   Future<void> showFile(String fileId) async {
//     var client = await getHttpClient();
//     var drive = ga.DriveApi(client);
//     var file = await drive.files.get(fileId, $fields: "webViewLink");
//     launch(file.webViewLink);
//   }
// }
