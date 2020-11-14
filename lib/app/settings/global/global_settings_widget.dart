import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const _GlobalSettingsLocalizationFieldWidget(),
          // const CurrentFediUiThemeChooserFormRowWidget(),
          // const _GlobalSettingsWebSocketsFieldWidget(),
          // const _GlobalSettingsShowSpoilerFieldWidget(),
          // const _GlobalSettingsShowNsfwSpoilerWidget(),
          // const _GlobalSettingsDefaultVisibilityFieldWidget(),
          // const _GlobalSettingsMediaNsfwByDefaultFieldWidget(),
          // const _GlobalSettingsMediaAutoInitFieldWidget(),
          // const _GlobalSettingsMediaAutoPlayFieldWidget(),
        ],
      );
}
//
// class _GlobalSettingsLocalizationFieldWidget extends StatelessWidget {
//   const _GlobalSettingsLocalizationFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//     return FormLocalizationCurrentLocaleFieldFormRowWidget(
//       label: S.of(context).app_localization_form_field_label,
//       field: GlobalSettingsBloc.localizationLocaleFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsMediaAutoPlayFieldWidget extends StatelessWidget {
//   const _GlobalSettingsMediaAutoPlayFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_mediaAutoPlay_label,
//       desc: null,
//       field: GlobalSettingsBloc.mediaAutoPlayFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsMediaAutoInitFieldWidget extends StatelessWidget {
//   const _GlobalSettingsMediaAutoInitFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_mediaAutoInit_label,
//       desc: null,
//       field: GlobalSettingsBloc.mediaAutoInitFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsMediaNsfwByDefaultFieldWidget extends StatelessWidget {
//   const _GlobalSettingsMediaNsfwByDefaultFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_mediaNsfwByDefault_label,
//       desc: null,
//       field: GlobalSettingsBloc.markMediaNsfwByDefaultFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsDefaultVisibilityFieldWidget extends StatelessWidget {
//   const _GlobalSettingsDefaultVisibilityFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormPleromaVisibilityFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_defaultVisibility_label,
//       desc: null,
//       field: GlobalSettingsBloc.defaultVisibilityFieldBloc,
//       displayIcon: false,
//     );
//   }
// }
//
// class _GlobalSettingsShowNsfwSpoilerWidget extends StatelessWidget {
//   const _GlobalSettingsShowNsfwSpoilerWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label: S.of(context).app_account_my_settings_field_alwaysShowNsfw_label,
//       desc: null,
//       field: GlobalSettingsBloc.isAlwaysShowNsfwFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsShowSpoilerFieldWidget extends StatelessWidget {
//   const _GlobalSettingsShowSpoilerFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_alwaysShowSpoiler_label,
//       desc: null,
//       field: GlobalSettingsBloc.isAlwaysShowSpoilerFieldBloc,
//     );
//   }
// }
//
// class _GlobalSettingsWebSocketsFieldWidget extends StatelessWidget {
//   const _GlobalSettingsWebSocketsFieldWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var GlobalSettingsBloc = IGlobalSettingsBloc.of(context);
//
//     return FormBoolFieldFormRowWidget(
//       label:
//           S.of(context).app_account_my_settings_field_websocketsEnabled_label,
//       desc: S
//           .of(context)
//           .app_account_my_settings_field_websocketsEnabled_description,
//       field: GlobalSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
//     );
//   }
// }
