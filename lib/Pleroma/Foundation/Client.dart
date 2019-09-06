import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import './Requests/Registration.dart';
import '../Models/ClientSettings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:hive/hive.dart';

part 'Client.g.dart';

enum HTTPMethod { GET, HEAD, POST, PUT, DELETE, PATCH }

@HiveType()
class Client {
  @HiveField(0)
  String accessToken;
  @HiveField(1)
  String baseURL;
  ClientSettings clientSettings;

  Client({baseURL}) {
    this.baseURL = "https://$baseURL";
  }

  Future<http.Response> register() async {
    Map<String, String> params = {
      "client_name": "Fediverse",
      "redirect_uris": "com.fediverse.app://addNewInstance",
      "scopes": "read write follow push",
      "website": "https://fediverse.app"
    };

    final url = "$baseURL${Registration.register}";
    try {
      final response = await http.post("$url", body: params);
      return response;
    } catch (e) {
      return e;
    }
  }

  launchAuth(sucess(String code), error(String error)) async {
    var successMethod = sucess;
    var errorMethod = error;
    var url = Registration.authorize(this);
    if (await canLaunch(url)) {
      await launch(url);
      getUriLinksStream().listen((Uri uri) {
        // Parse the link and warn the user, if it is not correct
        closeWebView();
        print(uri);
        this.clientSettings.code = uri.queryParameters['code'].toString();
        successMethod(this.clientSettings.code);
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
        closeWebView();

        errorMethod(err.toString());
      });
    } else {
      errorMethod('Could not launch $url');
    }
  }

  Future<http.Response> getAuthToken() async {
    final url = Registration.getAuthToken(this);
    try {
      final response = await http.post(url);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<http.Response> run(
      {String path,
      dynamic params,
      HTTPMethod method,
      List<int> bodyBites}) async {
    var url = "$baseURL$path";

    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    try {
      if (method == HTTPMethod.GET) {
        final respons = await http.get(url, headers: headers);
        return respons;
      } else if (method == HTTPMethod.HEAD) {
        final respons = await http.head(url, headers: headers);
        return respons;
      } else if (method == HTTPMethod.POST) {
        if (bodyBites != null) {
          final respons =
              await http.post(url, headers: headers, body: bodyBites);
          return respons;
        } else {
          final respons = await http.post(url,
              headers: headers,
              body: json.encode(params),
              encoding: Encoding.getByName("utf-8"));
          return respons;
        }
      } else if (method == HTTPMethod.PUT) {
        final respons = await http.put(url, headers: headers, body: params);
        return respons;
      } else if (method == HTTPMethod.DELETE) {
        final respons = await http.delete(url, headers: headers);
        return respons;
      } else {
        final respons = await http.patch(url, headers: headers, body: params);
        return respons;
      }
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  Future<http.StreamedResponse> runUpload(
      {String path, List<File> files}) async {
    var url = "$baseURL$path";

    print("TRYING TO UPLOAD");
    try {
      var postUri = Uri.parse(url);
      var request = new http.MultipartRequest(
        "POST",
        postUri,
      );
      request.headers['authorization'] = "Bearer $accessToken";

      var file = files[0];
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();

      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);

      var response = await request.send();
      return response;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}
