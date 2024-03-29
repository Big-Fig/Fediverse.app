import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountFeaturedHashtagBloc implements IDisposable {
  static IMyAccountFeaturedHashtagBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountFeaturedHashtagBloc>(
        context,
        listen: listen,
      );

  IMyAccountFeaturedHashtag get featuredHashtag;

  bool get unFeatured;

  Stream<bool> get unFeaturedStream;

  Future<void> unFeature();

  Future<void> featureAgain();
}
