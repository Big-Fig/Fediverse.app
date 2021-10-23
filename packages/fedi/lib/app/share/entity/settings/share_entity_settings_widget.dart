import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShareEntitySettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const ShareEntitySettingsWidget({
    Key? key,
    this.shrinkWrap = true,
  }) : super(key: key);

  @override
  // ignore: code-metrics
  Widget build(BuildContext context) {
    var shareEntitySettingsBloc = IShareEntitySettingsBloc.of(context);
    var shareEntity = shareEntitySettingsBloc.shareEntity;

    return StreamBuilder<ShareEntitySettings>(
      stream: shareEntitySettingsBloc.shareEntitySettingsStream,
      initialData: shareEntitySettingsBloc.shareEntitySettings,
      builder: (context, snapshot) {
        var shareEntitySettings = snapshot.data!;

        return Column(
          mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (shareEntity.isAllHaveLink)
              const _EditShareEntitySettingsWholeAsLinkBoolFieldFieldWidget(),
            if (shareEntity.isHaveFromAccount &&
                !shareEntitySettings.wholeAsLink)
              const _EditShareEntitySettingsAppendFromAccountBoolFieldFieldWidget(),
            if (shareEntity.isHaveCreatedAt && !shareEntitySettings.wholeAsLink)
              const _EditShareEntitySettingsCreatedAtBoolFieldFieldWidget(),
            if (shareEntity.isHaveMedia &&
                !shareEntity.isHaveOnlyMedia &&
                !shareEntitySettings.wholeAsLink)
              const _EditShareEntitySettingsMediaBoolFieldFieldWidget(),
            if (shareEntity.isHaveText &&
                !shareEntity.isHaveOnlyText &&
                !shareEntitySettings.wholeAsLink)
              const _EditShareEntitySettingsTextBoolFieldFieldWidget(),
            if (shareEntity.isHaveLink && !shareEntitySettings.wholeAsLink)
              const _EditShareEntitySettingsLinkBoolFieldFieldWidget(),
            if (shareEntity.isHaveMedia &&
                !shareEntity.isHaveLocalMedia &&
                !shareEntitySettings.wholeAsLink &&
                shareEntitySettings.withMedia)
              const _EditShareEntitySettingsMediaAsLinkBoolFieldFieldWidget(),
            const _EditShareEntitySettingsWithMessageBoolFieldFieldWidget(),
          ],
        );
      },
    );
  }
}

class _EditShareEntitySettingsAppendFromAccountBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsAppendFromAccountBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.appendFromAccountBoolField,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_share_entity_settings_field_appendFromAccount_label,
        ),
      );
}

class _EditShareEntitySettingsCreatedAtBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsCreatedAtBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withCreatedAtBoolField,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_share_entity_settings_field_withCreatedAt_label,
        ),
      );
}

class _EditShareEntitySettingsMediaBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsMediaBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withMediaBoolField,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_share_entity_settings_field_withMedia_label,
        ),
      );
}

class _EditShareEntitySettingsTextBoolFieldFieldWidget extends StatelessWidget {
  const _EditShareEntitySettingsTextBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withTextBoolField,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_share_entity_settings_field_withText_label,
        ),
      );
}

class _EditShareEntitySettingsLinkBoolFieldFieldWidget extends StatelessWidget {
  const _EditShareEntitySettingsLinkBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withLinkBoolField,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_share_entity_settings_field_withLink_label,
        ),
      );
}

class _EditShareEntitySettingsWholeAsLinkBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsWholeAsLinkBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.wholeAsLinkBoolField,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_share_entity_settings_field_wholeAsLink_label,
        ),
      );
}

class _EditShareEntitySettingsMediaAsLinkBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsMediaAsLinkBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.mediaAsLinkBoolField,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_share_entity_settings_field_mediaAsLink_label,
        ),
      );
}

class _EditShareEntitySettingsWithMessageBoolFieldFieldWidget
    extends StatelessWidget {
  const _EditShareEntitySettingsWithMessageBoolFieldFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IShareEntitySettingsBloc, IStringValueFormFieldBloc>(
        update: (context, value, previous) => value.withMessageStringField,
        child: StringValueFormFieldRowWidget(
          label: null,
          hint: S.of(context).app_share_entity_settings_field_withMessage_hint,
          autocorrect: true,
          textInputAction: TextInputAction.done,
          onSubmitted: null,
        ),
      );
}
