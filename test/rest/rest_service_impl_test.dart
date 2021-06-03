import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('createUrl simple', () {
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
      ),
      Uri.parse('https://pleroma.com/one'),
    );
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com/'),
        relativeUrlPath: 'one',
      ),
      Uri.parse('https://pleroma.com/one'),
    );
  });

  test('createUrl queryArgs single', () {
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
        queryArgs: [RestRequestQueryArg(key: 'arg1', value: 'value1')],
      ),
      Uri.parse('https://pleroma.com/one?arg1=value1'),
    );
  });
  test('createUrl queryArgs single and null', () {
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
        queryArgs: [
          RestRequestQueryArg(key: 'arg1', value: 'value1'),
          RestRequestQueryArg(key: 'arg2', value: null),
        ],
      ),
      Uri.parse('https://pleroma.com/one?arg1=value1'),
    );
  });
  test('createUrl queryArgs two', () {
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
        queryArgs: [
          RestRequestQueryArg(key: 'arg1', value: 'value1'),
          RestRequestQueryArg(key: 'arg2', value: 'value2'),
        ],
      ),
      Uri.parse('https://pleroma.com/one?arg1=value1&arg2=value2'),
    );
  });
  test('createUrl query args array', () {
    expect(
      RestService.createUrl(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
        queryArgs: [
          RestRequestQueryArg(key: 'arg1', value: 'value1'),
          RestRequestQueryArg(key: 'arg2', value: 'value2'),
          RestRequestQueryArg(key: 'arg2', value: 'value2'),
        ],
      ),
      Uri.parse('https://pleroma.com/one?arg1=value1&arg2=value2&arg2=value2'),
    );
  });
}
