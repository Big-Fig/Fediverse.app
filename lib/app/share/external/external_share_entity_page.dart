import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc_impl.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_widget.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/entity/share_entity_widget.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/external/external_share_entity_bloc_impl.dart';
import 'package:fedi/app/share/page/share_page_app_bar_send_text_action_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExternalShareEntityPage extends StatelessWidget {
  const ExternalShareEntityPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_share_external_title,
          actions: const [
            SharePageAppBarSendTextActionWidget(),
          ],
        ),
        body: const SingleChildScrollView(
          child: ShareEntityWidget(
            footer: ShareEntitySettingsWidget(),
          ),
        ),
      );
}

void goToExternalShareEntityPage({
  required BuildContext context,
  required ShareEntity shareEntity,
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    createExternalShareEntityPageRoute(
      context: context,
      shareEntity: shareEntity,
      instanceLocation: instanceLocation,
    ),
  );
}

MaterialPageRoute<void> createExternalShareEntityPageRoute({
  required BuildContext context,
  required ShareEntity shareEntity,
  required InstanceLocation instanceLocation,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => ShareEntitySettingsBloc.provideToContext(
        context,
        shareEntity: shareEntity,
        child: Provider<ShareEntity>.value(
          value: shareEntity,
          child: DisposableProxyProvider<ShareEntity, ExternalShareEntityBloc>(
            update: (context, value, previous) =>
                ExternalShareEntityBloc.createFromContext(
              context,
              shareEntity: value,
              popupTitle: S.of(context).app_share_external_title,
            ),
            child: ProxyProvider<ExternalShareEntityBloc, IShareEntityBloc>(
              update: (context, value, previous) => value,
              child: ProxyProvider<ExternalShareEntityBloc, IExternalShareBloc>(
                update: (context, value, previous) => value,
                child: const ExternalShareBlocProxyProvider(
                  child: ExternalShareEntityPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
