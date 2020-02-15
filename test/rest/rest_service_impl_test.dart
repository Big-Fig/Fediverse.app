import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('createUrl simple', () {
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com", relativeUrlPath: "one"),
        Uri.parse("https://pleroma.com/one"));
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com/", relativeUrlPath: "one"),
        Uri.parse("https://pleroma.com/one"));
  });

  test('createUrl queryArgs single', () {
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com",
            relativeUrlPath: "one",
            queryArgs: {"arg1": "value1"}),
        Uri.parse("https://pleroma.com/one?arg1=value1"));
  });
  test('createUrl queryArgs single and null', () {
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com",
            relativeUrlPath: "one",
            queryArgs: {
              "arg1": "value1",
              "arg2": null,
            }),
        Uri.parse("https://pleroma.com/one?arg1=value1"));
  });
  test('createUrl queryArgs two', () {
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com",
            relativeUrlPath: "one",
            queryArgs: {
              "arg1": "value1",
              "arg2": "value2",
            }),
        Uri.parse("https://pleroma.com/one?arg1=value1&arg2=value2"));
  });
  test('createUrl additionalQueryArgsString', () {
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com",
            relativeUrlPath: "one",
            queryArgs: {
              "arg1": "value1",
              "arg2": "value2",
            },
            additionalQueryArgsString: "arg3=value3"),
        Uri.parse(
            "https://pleroma.com/one?arg1=value1&arg2=value2&arg3=value3"));
    expect(
        RestService.createUrl(
            baseUrl: "https://pleroma.com",
            relativeUrlPath: "one",
            additionalQueryArgsString: "arg3=value3"),
        Uri.parse("https://pleroma.com/one?arg3=value3"));
  });
}
