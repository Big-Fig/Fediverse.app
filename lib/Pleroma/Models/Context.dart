
import 'dart:convert';
import 'package:fedi/Pleroma/Models/Status.dart';

Context contextFromJson(String str) => Context.fromJson(json.decode(str));

String contextToJson(Context data) => json.encode(data.toJson());

class Context {
    List<Status> descendants;
    List<Status> ancestors;

    Context({
        this.descendants,
        this.ancestors,
    });

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        descendants: List<Status>.from(json["descendants"].map((x) => Status.fromJson(x))),
        ancestors: List<Status>.from(json["ancestors"].map((x) => Status.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "descendants": List<dynamic>.from(descendants.map((x) => x)),
        "ancestors": List<dynamic>.from(ancestors.map((x) => x.toJson())),
    };
}