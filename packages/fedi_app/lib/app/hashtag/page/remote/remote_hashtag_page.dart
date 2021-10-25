import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_widget.dart';
import 'package:fedi_app/app/hashtag/page/local/local_hashtag_page_bloc.dart';
import 'package:fedi_app/app/hashtag/page/remote/remote_hashtag_page_bloc.dart';
import 'package:fedi_app/app/hashtag/page/remote/remote_hashtag_page_bloc_impl.dart';
import 'package:fedi_app/app/hashtag/status_list/network_only/hashtag_status_list_network_only_list_timeline_widget.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteHashtagPage extends StatelessWidget {
  const RemoteHashtagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: HashtagPageAppBarWidget(),
        body: SafeArea(
          child: RemoteHashtagPageBodyWidget(),
        ),
      );
}

MaterialPageRoute<void> createRemoteHashtagPageRoute({
  required Uri remoteInstanceUri,
  required IHashtag hashtag,
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: ProxyProvider<IRemoteInstanceBloc, IUnifediApiInstance>(
          update: (context, value, previous) => value.unifediApiInstance!,
          child: RemoteHashtagPageBloc.provideToContext(
            context,
            hashtag: hashtag,
            child: const RemoteHashtagPage(),
          ),
        ),
      ),
    );

Future<void> goToRemoteHashtagPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
  required IHashtag hashtag,
}) async {
  var dialogResult = await UnifediAsyncOperationHelper
      .performUnifediAsyncOperation<IRemoteInstanceBloc>(
    context: context,
    asyncCode: () async {
      var remoteInstanceBloc = RemoteInstanceBloc.createFromContext(
        context,
        instanceUri: remoteInstanceUri,
      );

      await remoteInstanceBloc.performAsyncInit();

      return remoteInstanceBloc;
    },
  );

  var remoteInstanceBloc = dialogResult.result;
  if (remoteInstanceBloc != null) {
    await Navigator.push(
      context,
      createRemoteHashtagPageRoute(
        remoteInstanceUri: remoteInstanceUri,
        hashtag: hashtag,
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}

class RemoteHashtagPageBodyWidget extends StatelessWidget {
  const RemoteHashtagPageBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var remoteHashtagPageBloc = IRemoteHashtagPageBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: remoteHashtagPageBloc,
      loadingFinishedBuilder: (context) =>
          DisposableProxyProvider<ILocalHashtagPageBloc, IScrollControllerBloc>(
        update: (context, hashtagPageBloc, _) => ScrollControllerBloc(
          scrollController: hashtagPageBloc.scrollController,
        ),
        child:
            ProxyProvider<IRemoteHashtagPageBloc, IStatusNetworkOnlyListBloc>(
          update: (context, hashtagPageBloc, _) =>
              hashtagPageBloc.statusNetworkOnlyListBloc,
          child: StatusNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<IRemoteHashtagPageBloc,
                IStatusNetworkOnlyPaginationBloc>(
              update: (context, hashtagPageBloc, _) =>
                  hashtagPageBloc.statusNetworkOnlyPaginationBloc,
              child: StatusNetworkOnlyPaginationBlocProxyProvider(
                child: ProxyProvider<IRemoteHashtagPageBloc,
                    IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
                  update: (context, hashtagPageBloc, _) =>
                      hashtagPageBloc.statusPaginationListBloc,
                  child: ProxyProvider<
                      IPaginationListBloc<PaginationPage<IStatus>, IStatus>,
                      IPaginationListBloc>(
                    update: (context, value, previous) => value,
                    child: const CollapsibleOwnerWidget(
                      child: HashtagStatusListNetworkOnlyListTimelineWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
