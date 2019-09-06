// To parse this JSON data, do
//
//     final clientSettings = clientSettingsFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';
part 'ClientSettings.g.dart';

ClientSettings clientSettingsFromJson(String str) => ClientSettings.fromJson(json.decode(str));

String clientSettingsToJson(ClientSettings data) => json.encode(data.toJson());


@HiveType()
class ClientSettings {
    @HiveField(0)
    String clientId;
    @HiveField(1)
    String clientSecret;
    @HiveField(2)
    String id;
    @HiveField(3)
    String name;
    @HiveField(4)
    String redirectUri;
    @HiveField(5)
    String website;
    @HiveField(6)
    String vapidKey;
    @HiveField(7)
    String account;
    @HiveField(8)
    String code;

    ClientSettings({
        this.clientId,
        this.clientSecret,
        this.id,
        this.name,
        this.redirectUri,
        this.website,
        this.vapidKey,
        this.code = ""
    });

    factory ClientSettings.fromJson(Map<String, dynamic> json) => new ClientSettings(

        clientId: json["client_id"],
        clientSecret: json["client_secret"],
        id: json["id"],
        name: json["name"],
        redirectUri: json["redirect_uri"],
        website: json["website"],
        vapidKey: json["vapid_key"],
    );

    Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "id": id,
        "name": name,
        "redirect_uri": redirectUri,
        "website": website,
        "vapid_key": vapidKey,
    };



}
