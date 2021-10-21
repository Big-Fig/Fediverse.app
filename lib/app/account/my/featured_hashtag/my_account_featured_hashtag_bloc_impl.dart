import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountFeaturedHashtagBloc extends DisposableOwner
    implements IMyAccountFeaturedHashtagBloc {
  @override
  final IMyAccountFeaturedHashtag featuredHashtag;
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  MyAccountFeaturedHashtagBloc({
    required this.featuredHashtag,
    required this.unifediApiMyAccountService,
  }) {
    unFeaturedSubject.disposeWith(this);
  }

  final BehaviorSubject<bool> unFeaturedSubject = BehaviorSubject.seeded(false);

  @override
  bool get unFeatured => unFeaturedSubject.value;

  @override
  Stream<bool> get unFeaturedStream => unFeaturedSubject.stream;

  @override
  Future<void> unFeature() async {
    assert(
      !unFeatured,
      'cant unfeature when not featured',
    );

    await unifediApiMyAccountService.unfeatureMyAccountTag(
      tagId: featuredHashtag.remoteId!,
    );

    unFeaturedSubject.add(true);
  }

  @override
  Future<void> featureAgain() async {
    assert(unFeatured, 'cant feature if already featured');

    // ignore: avoid-ignoring-return-values
    await unifediApiMyAccountService.featureMyAccountTag(
      name: featuredHashtag.name,
    );

    unFeaturedSubject.add(false);
  }

  static MyAccountFeaturedHashtagBloc createFromContext(
    BuildContext context, {
    required IMyAccountFeaturedHashtag featuredHashtag,
  }) {
    var unifediApiMyAccountService = Provider.of<IUnifediApiMyAccountService>(
      context,
      listen: false,
    );

    return MyAccountFeaturedHashtagBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
      featuredHashtag: featuredHashtag,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IMyAccountFeaturedHashtag featuredHashtag,
  }) =>
      DisposableProvider<IMyAccountFeaturedHashtagBloc>(
        create: (context) => MyAccountFeaturedHashtagBloc.createFromContext(
          context,
          featuredHashtag: featuredHashtag,
        ),
        child: child,
      );
}
