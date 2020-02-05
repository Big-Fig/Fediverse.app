import 'dart:convert';

import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Results.g.dart';

@JsonSerializable()
class Results {
    List<Account> accounts = [];
    List<Status> statuses = [];
    // List<Hashtag> hashtags;

    Results({
        this.accounts,
        this.statuses,
        // this.hashtags,
    });


    factory Results.fromJson(Map<String, dynamic> json) =>
        _$ResultsFromJson(json);

    factory Results.fromJsonString(String jsonString) =>
        _$ResultsFromJson(jsonDecode(jsonString));

    Map<String, dynamic> toJson() => _$ResultsToJson(this);
    String toJsonString() => jsonEncode(_$ResultsToJson(this));

}
