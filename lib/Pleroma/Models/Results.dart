import 'dart:convert';

import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
    List<Account> accounts = [];
    List<Status> statuses = [];
    // List<Hashtag> hashtags;

    Results({
        this.accounts,
        this.statuses,
        // this.hashtags,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        accounts: json["accounts"] == null ? <Account>[] : List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
        statuses: json["statuses"] == null ? <Status>[] : List<Status>.from(json["statuses"].map((x) => Status.fromJson(x))),
        // hashtags: List<Hashtag>.from(json["hashtags"].map((x) => Hashtag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
        "statuses": List<dynamic>.from(statuses.map((x) => x.toJson())),
        // "hashtags": List<dynamic>.from(hashtags.map((x) => x.toJson())),
    };
}