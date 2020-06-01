import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:fedi/DeepLinks/DeepLinkHelper.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import './Requests/Registration.dart';
import '../Models/ClientSettings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:hive/hive.dart';

part 'Client.g.dart';

enum HTTPMethod { GET, HEAD, POST, PUT, DELETE, PATCH }

Map<HTTPMethod, String> httpMethodToStringMap = {
  HTTPMethod.GET: "get",
  HTTPMethod.HEAD: "head",
  HTTPMethod.POST: "post",
  HTTPMethod.PUT: "put",
  HTTPMethod.DELETE: "delete",
  HTTPMethod.PATCH: "patch",
};

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

  Future<http.Response> unsubscribeToPush() async {
   
    var url = "$baseURL/api/v1/push/subscription";
    print("THIS IS MY ACCESSTOKEN: $accessToken");
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    
    
    try {
      final response = await http.delete(url,
          headers: headers);
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print(e.toString());
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

  launchAuth(BuildContext context, error(String error)) async {
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
        DeepLinkHelper deepLinkHelper =
            DeepLinkHelper.of(context, listen: false);
        deepLinkHelper.loadNewInstancebycode(this.clientSettings.code);
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

  Future<http.Response> getAppAuthToken() async {
    final url = Registration.getAppToken(this);
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
      List<int> bodyBites,
      String overrideAccessToken}) async {
    var url = "$baseURL$path";

    print(url);
    print("MY TOKEN Bearer $accessToken");

    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    if (overrideAccessToken != null) {
      headers = {
        HttpHeaders.authorizationHeader: "Bearer $overrideAccessToken",
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
    }

    print(headers);

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
        final respons =
            await http.patch(url, headers: headers, body: json.encode(params));
        return respons;
      }
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  Future<http.Response> subscribeToPush(String token) async {

    var account = "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";
 
    var settings = await InstanceStorage.getAccountNotificationsSettings(account);
    if (settings == null){
      settings = PleromaPushSubscribeData(
                alerts: PleromaPushSettingsDataAlerts.defaultAllEnabled());
    }
        

      var url = "$baseURL/api/v1/push/subscription";
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    String baseUrl = CurrentInstance.instance.currentClient.baseURL
        .replaceAll("https://", "");
    String endpoint =
        "https://pushrelay3.your.org/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl&device=iOS";
    if (Platform.isAndroid) {
      endpoint =
          "https://pushrelay3.your.org/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl";
    } else {}


    
    dynamic params = {
      "data": {
        "alerts": {
          "favourite": settings.alerts.favourite,
          "follow": settings.alerts.follow,
          "mention": settings.alerts.mention,
          "reblog": settings.alerts.reblog,
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
