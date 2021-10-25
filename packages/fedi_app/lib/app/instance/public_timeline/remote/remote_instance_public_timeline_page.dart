import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi_app/app/instance/public_timeline/instance_public_timeline_widget.dart';
import 'package:fedi_app/app/instance/public_timeline/remote/remote_instance_public_timeline_page_bloc.dart';
import 'package:fedi_app/app/instance/public_timeline/remote/remote_instance_public_timeline_page_bloc_impl.dart';
import 'package:fedi_app/app/instance/public_timeline/status_list/network_only/instance_public_timeline_status_list_network_only_list_timeline_widget.dart';
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

class RemoteInstancePublicTimelinePage extends StatelessWidget {
  const RemoteInstancePublicTimelinePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstancePublicTimelinePageAppBarWidget(),
        body: SafeArea(
          child: RemoteInstancePublicTimelinePageBodyWidget(),
        ),
      );
}

MaterialPageRoute<void> createRemoteInstancePublicTimelinePageRoute({
  required Uri remoteInstanceUri,
  required IUnifediApiInstance unifediApiInstance,
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: ProxyProvider<IRemoteInstanceBloc, IUnifediApiInstance>(
          update: (context, value, previous) => value.unifediApiInstance!,
          child: RemoteInstancePublicTimelinePageBloc.provideToContext(
            context,
            unifediApiInstance: unifediApiInstance,
            child: const RemoteInstancePublicTimelinePage(),
          ),
        ),
      ),
    );

Future<void> goToRemoteInstancePublicTimelinePage({
  required BuildContext context,
  required Uri remoteInstanceUri,
  required IUnifediApiInstance unifediApiInstance,
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
      createRemoteInstancePublicTimelinePageRoute(
        remoteInstanceUri: remoteInstanceUri,
        unifediApiInstance: unifediApiInstance,
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}

class RemoteInstancePublicTimelinePageBodyWidget extends StatelessWidget {
  const RemoteInstancePublicTimelinePageBodyWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var remoteInstancePublicTimelinePageBloc =
        IRemoteInstancePublicTimelinePageBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: remoteInstancePublicTimelinePageBloc,
      loadingFinishedBuilder: (context) => DisposableProxyProvider<
          IInstancePublicTimelinePageBloc, IScrollControllerBloc>(
        update: (context, instancePublicTimelinePageBloc, _) =>
            ScrollControllerBloc(
          scrollController: instancePublicTimelinePageBloc.scrollController,
        ),
        child: ProxyProvider<IRemoteInstancePublicTimelinePageBloc,
            IStatusNetworkOnlyListBloc>(
          update: (context, instancePublicTimelinePageBloc, _) =>
              instancePublicTimelinePageBloc.statusNetworkOnlyListBloc,
          child: StatusNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<IRemoteInstancePublicTimelinePageBloc,
                IStatusNetworkOnlyPaginationBloc>(
              update: (context, instancePublicTimelinePageBloc, _) =>
                  instancePublicTimelinePageBloc
                      .statusNetworkOnlyPaginationBloc,
              child: StatusNetworkOnlyPaginationBlocProxyProvider(
                child: ProxyProvider<IRemoteInstancePublicTimelinePageBloc,
                    IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
                  update: (context, instancePublicTimelinePageBloc, _) =>
                      instancePublicTimelinePageBloc.statusPaginationListBloc,
                  child: ProxyProvider<
                      IPaginationListBloc<PaginationPage<IStatus>, IStatus>,
                      IPaginationListBloc>(
                    update: (context, value, previous) => value,
                    child: const CollapsibleOwnerWidget(
                      child:
                          InstancePublicTimelineStatusListNetworkOnlyListTimelineWidget(),
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
