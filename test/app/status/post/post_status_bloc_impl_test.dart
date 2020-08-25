import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../log_test_utils.dart';



void main() {
  initTestLog();
  test('findAcctMentionsInText', () {
    expect(PostStatusBloc.findAcctMentionsInText("@test"), ["test"]);
    expect(PostStatusBloc.findAcctMentionsInText("@ @test"), ["test"]);
    expect(PostStatusBloc.findAcctMentionsInText("@test1 @test2"), [
      "test1",
      "test2",
    ]);
    expect(PostStatusBloc.findAcctMentionsInText("@ @test@pleroma.com"),
        ["test@pleroma.com"]);
  });

  test('prependAccts', () {
    expect(
        PostStatusBloc.prependAccts("text", ["test1", "test2"]),
        "@test1, @test2 text");
  });
}
