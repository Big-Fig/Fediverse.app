import 'dart:convert';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Results.g.dart';

@JsonSerializable()
class Results {
    List<PleromaAccount> accounts = [];
    List<PleromaStatus> statuses = [];
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
