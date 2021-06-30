import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class MyAccountFeaturedHashtagBloc extends DisposableOwner
    implements IMyAccountFeaturedHashtagBloc {
  @override
  final IMyAccountFeaturedHashtag featuredHashtag;
  final IPleromaApiFeaturedTagsService pleromaApiFeaturedTagsService;

  MyAccountFeaturedHashtagBloc({
    required this.featuredHashtag,
    required this.pleromaApiFeaturedTagsService,
  }) {
    unFeaturedSubject.disposeWith(this);
  }

  final BehaviorSubject<bool> unFeaturedSubject = BehaviorSubject.seeded(false);

  @override
  bool get unFeatured => unFeaturedSubject.value;

  @override
  Stream<bool> get unFeaturedStream => unFeaturedSubject.stream;

  @override
  Future unFeature() async {
    assert(!unFeatured);

    await pleromaApiFeaturedTagsService.unFeatureTag(
      id: featuredHashtag.remoteId,
    );

    unFeaturedSubject.add(true);
  }

  @override
  Future featureAgain() async {
    assert(unFeatured);

    await pleromaApiFeaturedTagsService.featureTag(
      name: featuredHashtag.name,
    );

    unFeaturedSubject.add(false);
  }

  static MyAccountFeaturedHashtagBloc createFromContext(
    BuildContext context, {
    required IMyAccountFeaturedHashtag featuredHashtag,
  }) {
    var pleromaApiFeaturedTagsService = IPleromaApiFeaturedTagsService.of(
      context,
      listen: false,
    );

    return MyAccountFeaturedHashtagBloc(
      pleromaApiFeaturedTagsService: pleromaApiFeaturedTagsService,
      featuredHashtag: featuredHashtag,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IMyAccountFeaturedHashtag featuredHashtag,
  }) {
    return DisposableProvider<IMyAccountFeaturedHashtagBloc>(
      create: (context) => MyAccountFeaturedHashtagBloc.createFromContext(
        context,
        featuredHashtag: featuredHashtag,
      ),
      child: child,
    );
  }
}
