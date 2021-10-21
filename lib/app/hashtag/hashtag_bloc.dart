import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHashtagBloc implements IDisposable {
  static IHashtagBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IHashtagBloc>(
        context,
        listen: listen,
      );

  IHashtag get hashtag;

  IMyAccountFeaturedHashtag? get featuredHashtag;

  Stream<IMyAccountFeaturedHashtag?> get featuredHashtagStream;

  Stream<bool> get isLoadingFeaturedHashtagStateStream;

  bool get isLoadingFeaturedHashtagState;

  bool get featured;

  Stream<bool> get featuredStream;

  bool get isInstanceSupportFeaturedTags;

  Future<void> feature();

  Future<void> unFeature();
}
