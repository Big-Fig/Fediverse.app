import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:test/test.dart';

void main() {
  test('createUrl simple', () {
    expect(
      RestService.createUri(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
      ),
      Uri.parse('https://pleroma.com/one'),
    );
    expect(
      RestService.createUri(
        baseUri: Uri.parse('https://pleroma.com/'),
        relativeUrlPath: 'one',
      ),
      Uri.parse('https://pleroma.com/one'),
    );
  });

  test('createUrl queryArgs single', () {
    expect(
      RestService.createUri(
        baseUri: Uri.parse('https://pleroma.com'),
        relativeUrlPath: 'one',
        queryArgs: [RestRequestQueryArg(key: 'arg1', value: 'value1')],
      ),
      Uri.parse('https://pleroma.com/one?arg1=value1'),
    );
  });
  test('createUrl queryArgs single and null', () {
    expect(
      RestService.createUri(
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
      RestService.createUri(
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
      RestService.createUri(
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
