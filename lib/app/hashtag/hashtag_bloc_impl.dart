import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model_adapter.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class HashtagBloc extends DisposableOwner implements IHashtagBloc {
  @override
  final IHashtag hashtag;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final bool needLoadFeaturedState;

  final UnifediApiAccess authInstance;

  @override
  bool get isInstanceSupportFeaturedTags =>
      unifediApiMyAccountService.isFeatureSupported(
        unifediApiMyAccountService.featureMyAccountTagFeature,
      );

  HashtagBloc({
    required this.hashtag,
    required this.unifediApiMyAccountService,
    required this.needLoadFeaturedState,
    required this.authInstance,
    required IMyAccountFeaturedHashtag? featuredHashtag,
  }) : featuredHashtagSubject = BehaviorSubject.seeded(featuredHashtag) {
    featuredHashtagSubject.disposeWith(this);
    isLoadingFeaturedHashtagStateSubject.disposeWith(this);

    if (needLoadFeaturedState && featuredHashtag == null) {
      loadFeaturedState();
    }
  }

  final BehaviorSubject<bool> isLoadingFeaturedHashtagStateSubject =
      BehaviorSubject.seeded(false);

  @override
  Stream<bool> get isLoadingFeaturedHashtagStateStream =>
      isLoadingFeaturedHashtagStateSubject.stream;

  @override
  bool get isLoadingFeaturedHashtagState =>
      isLoadingFeaturedHashtagStateSubject.value;

  final BehaviorSubject<IMyAccountFeaturedHashtag?> featuredHashtagSubject;

  @override
  bool get featured => featuredHashtag != null;

  @override
  Stream<bool> get featuredStream => featuredHashtagSubject.stream.map(
        (featuredHashtag) => featuredHashtag != null,
      );

  @override
  IMyAccountFeaturedHashtag? get featuredHashtag =>
      featuredHashtagSubject.value;

  @override
  Stream<IMyAccountFeaturedHashtag?> get featuredHashtagStream =>
      featuredHashtagSubject.stream;

  @override
  Future feature() async {
    assert(!featured);

    var unifediApiFeatureTag =
        await unifediApiMyAccountService.featureMyAccountTag(
      name: hashtag.name,
    );

    featuredHashtagSubject
        .add(unifediApiFeatureTag.toMyAccountFeaturedHashtag());
  }

  @override
  Future unFeature() async {
    assert(featured);

    await unifediApiMyAccountService.unfeatureMyAccountTag(
      tagId: featuredHashtag!.remoteId!,
    );

    featuredHashtagSubject.add(null);
  }

  static HashtagBloc createFromContext(
    BuildContext context, {
    required IHashtag hashtag,
    required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
    required bool needLoadFeaturedState,
  }) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context, listen: false);

    return HashtagBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
      hashtag: hashtag,
      authInstance: ICurrentUnifediApiAccessBloc.of(context, listen: false)
          .currentInstance!,
      featuredHashtag: myAccountFeaturedHashtag,
      needLoadFeaturedState: needLoadFeaturedState,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IHashtag hashtag,
    required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
    required bool needLoadFeaturedState,
  }) {
    return DisposableProvider<IHashtagBloc>(
      create: (context) => HashtagBloc.createFromContext(
        context,
        hashtag: hashtag,
        myAccountFeaturedHashtag: myAccountFeaturedHashtag,
        needLoadFeaturedState: needLoadFeaturedState,
      ),
      child: child,
    );
  }

  Future loadFeaturedState() async {
    if (!isInstanceSupportFeaturedTags) {
      return;
    }

    isLoadingFeaturedHashtagStateSubject.add(true);
    var unifediApiTags =
        await unifediApiMyAccountService.getMyAccountFeaturedTags(
      pagination: null,
    );

    var found = unifediApiTags
        .map(
          (unifediApiTag) => unifediApiTag.toMyAccountFeaturedHashtag(),
        )
        .firstWhereOrNull(
          (featuredTag) => featuredTag.name == hashtag.name,
        );

    featuredHashtagSubject.add(found);

    isLoadingFeaturedHashtagStateSubject.add(false);
  }
}
