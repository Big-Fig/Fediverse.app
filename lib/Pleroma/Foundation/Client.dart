import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:phaze/DeepLinks/DeepLinkHelper.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
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
  Function(String) successMethod;
  @HiveField(0)
  String accessToken;
  @HiveField(1)
  String baseURL;
  ClientSettings clientSettings;
  Stream<Uri> uri;
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

  getlink() async {
    // Uri parsing may fail, so we use a try/catch FormatException.
    try {
      Uri initialUri = await getInitialUri();
      print("GETTING LINK");

      if (initialUri == null) {
        return;
      }
      if (initialUri.queryParameters['code'] == null) {
        return;
      }
      print("success!!! $initialUri");
      closeWebView();
      print(uri);
      var code = initialUri.queryParameters['code'].toString();
      successMethod(code);

      // Use the uri and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on FormatException {
      print("ERROR");
      // Handle exception by warning the user their action did not succeed
      // return?
    }
    // ... other exception handling like PlatformException
  }

  launchAuth(error(String error)) async {
    var errorMethod = error;
    var success = false;
    var url = Registration.authorize(this);
    if (await canLaunch(url)) {
      await launch(url);
      getUriLinksStream().listen((Uri uri) {
        // Parse the link and warn the user, if it is not correct
        if (success == true) {
          return;
        }

        success = true;
        closeWebView();
        print(uri);
        this.clientSettings.code = uri.queryParameters['code'].toString();
        DeepLinkHelper.loadNewInstancebycode(this.clientSettings.code);
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

    print(url);
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

  Future<http.Response> subscribeToPush(String token) async {
    var url = "$baseURL/api/v1/push/subscription";
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    String baseUrl = CurrentInstance.instance.currentClient.baseURL
        .replaceAll("https://", "");
    String endpoint =
        "http://fedi-relay.herokuapp.com/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl&device=iOS";
    if (Platform.isAndroid) {
      endpoint =
          "http://fedi-relay.herokuapp.com/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl";
    } else {}
    dynamic params = {
      "data": {
        "alerts": {
          "favourite": true,
          "follow": true,
          "mention": true,
          "reblog": true,
        },
      },
      "subscription": {
        "keys": {
          "p256dh":
              "BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8quUowlrPyfXlMa6tABLqqcSpOpMnC1-o_UB_s4R8NQsqMLbASjnqSbqw=",
          "auth": "T5bhIIyre5TDC1LyX4mFAQ==",
        },
        "endpoint": endpoint
      }
    };

    var jsonData = json.encode(params);
    print(jsonData);
    try {
      final response = await http.post(url,
          headers: headers,
          body: jsonData,
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}

/*
let jsonObject = ["data":
            ["alerts":
                ["favourite":UserDefaults.standard.object(forKey: "pnlikes") as? Bool ?? true,
                 "follow":UserDefaults.standard.object(forKey: "pnfollows") as? Bool ?? true,
                 "mention": UserDefaults.standard.object(forKey: "pnmentions") as? Bool ?? true,
                 "reblog":UserDefaults.standard.object(forKey: "pnboosts") as? Bool ?? true]
            ],
                    "subscription":
                        ["keys":
                            ["p256dh":"BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8quUowlrPyfXlMa6tABLqqcSpOpMnC1-o_UB_s4R8NQsqMLbASjnqSbqw=",
                             "auth":"T5bhIIyre5TDC1LyX4mFAQ=="
                            ],
                          "endpoint":"https://pushrelay-roma1-fcm.your.org/push/\(fcmToken)?account=test&server=server&device=iOS"
                           // "endpoint":"https://rails-toot-test.herokuapp.com/push/\(fcmToken)?account=test&server=server&device=iOS"
            ]
        ]
        //create the url with URL

        let url = URL(string: "https://\(StoreStruct.currentInstance.returnedText)/api/v1/push/subscription")! //change the url
        //create the session object
        let session = URLSession.shared
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        
        do {
            let jsonData = try JSONSerialization.data(
                withJSONObject: jsonObject,
                options: [])
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            request.httpBody = jsonData
            print("JSON String : " + jsonString!)
        }
        catch {
            print(error.localizedDescription)
        }
        request.httpMethod = "DELETE"// "POST" //set http method as POST
        request.setValue("Bearer \(StoreStruct.currentInstance.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            //create the url with URL
            let url = URL(string: "https://\(StoreStruct.currentInstance.returnedText)/api/v1/push/subscription")! //change the url
            
            //create the session object
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"// "POST" //set http method as POST
            
           
            
            // "https://pushrelay-roma1-fcm.your.org/push/\(fcmToken)?account=test&server=server"
            
            do {
                let jsonData = try JSONSerialization.data(
                    withJSONObject: jsonObject,
                    options: [])
                let jsonString = String(data: jsonData, encoding: .utf8)
                
                request.httpBody = jsonData
                print("JSON String : " + jsonString!)
            }
            catch {
                print(error.localizedDescription)
            }
            request.setValue("Bearer \(StoreStruct.currentInstance.accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        // handle json...
                    }
                    Account.pushSetSuccess(instance: "\(StoreStruct.currentUser.username)@\(StoreStruct.currentInstance.returnedText)")
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
            
        })
        task.resume()
    }
    */
