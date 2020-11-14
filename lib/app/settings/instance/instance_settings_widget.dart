import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceSettingsWidget extends StatelessWidget {
  const InstanceSettingsWidget();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const _InstanceSettingsLocalizationFieldWidget(),
          // const CurrentFediUiThemeChooserFormRowWidget(),
          // const _InstanceSettingsWebSocketsFieldWidget(),
          // const _InstanceSettingsShowSpoilerFieldWidget(),
          // const _InstanceSettingsShowNsfwSpoilerWidget(),
          // const _InstanceSettingsDefaultVisibilityFieldWidget(),
          // const _InstanceSettingsMediaNsfwByDefaultFieldWidget(),
          // const _InstanceSettingsMediaAutoInitFieldWidget(),
          // const _InstanceSettingsMediaAutoPlayFieldWidget(),
        ],
      );
}
//
// class _InstanceSettingsLocalizationFieldWidget extends StatelessWidget {
//   const _InstanceSettingsLocalizationFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//     return FormLocalizationCurrentLocaleFieldFormRowWidget(
//       label: S.of(context).app_localization_form_field_label,
//       field: InstanceSettingsBloc.localizationLocaleFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsMediaAutoPlayFieldWidget extends StatelessWidget {
//   const _InstanceSettingsMediaAutoPlayFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_mediaAutoPlay_label,
//       desc: null,
//       field: InstanceSettingsBloc.mediaAutoPlayFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsMediaAutoInitFieldWidget extends StatelessWidget {
//   const _InstanceSettingsMediaAutoInitFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_mediaAutoInit_label,
//       desc: null,
//       field: InstanceSettingsBloc.mediaAutoInitFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsMediaNsfwByDefaultFieldWidget extends StatelessWidget {
//   const _InstanceSettingsMediaNsfwByDefaultFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_mediaNsfwByDefault_label,
//       desc: null,
//       field: InstanceSettingsBloc.markMediaNsfwByDefaultFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsDefaultVisibilityFieldWidget extends StatelessWidget {
//   const _InstanceSettingsDefaultVisibilityFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormPleromaVisibilityFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_defaultVisibility_label,
//       desc: null,
//       field: InstanceSettingsBloc.defaultVisibilityFieldBloc,
//       displayIcon: false,
//     );
//   }
// }
//
// class _InstanceSettingsShowNsfwSpoilerWidget extends StatelessWidget {
//   const _InstanceSettingsShowNsfwSpoilerWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_alwaysShowNsfw_label,
//       desc: null,
//       field: InstanceSettingsBloc.isAlwaysShowNsfwFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsShowSpoilerFieldWidget extends StatelessWidget {
//   const _InstanceSettingsShowSpoilerFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_alwaysShowSpoiler_label,
//       desc: null,
//       field: InstanceSettingsBloc.isAlwaysShowSpoilerFieldBloc,
//     );
//   }
// }
//
// class _InstanceSettingsWebSocketsFieldWidget extends StatelessWidget {
//   const _InstanceSettingsWebSocketsFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var InstanceSettingsBloc = IInstanceSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_websocketsEnabled_label,
//       desc: S
//           .of(context)
//           .app_account_my_settings_field_websocketsEnabled_description,
//       field: InstanceSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
//     );
//   }
// }
