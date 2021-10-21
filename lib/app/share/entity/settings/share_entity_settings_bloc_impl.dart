import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ShareEntitySettingsBloc extends FormBloc
    implements IShareEntitySettingsBloc {
  @override
  final ShareEntity shareEntity;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> wholeAsLinkBoolField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> appendFromAccountBoolField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> mediaAsLinkBoolField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> withCreatedAtBoolField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> withLinkBoolField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> withMediaBoolField;

  @override
  // ignore: avoid-late-keyword
  late IStringValueFormFieldBloc withMessageStringField;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> withTextBoolField;

  @override
  ShareEntitySettings get shareEntitySettings =>
      shareEntitySettingsBehaviourSubject.value;

  @override
  List<IFormItemBloc> get currentItems => [
        wholeAsLinkBoolField,
        appendFromAccountBoolField,
        mediaAsLinkBoolField,
        withCreatedAtBoolField,
        withLinkBoolField,
        withMediaBoolField,
        withMessageStringField,
        withTextBoolField,
      ];

  @override
  Stream<ShareEntitySettings> get shareEntitySettingsStream =>
      shareEntitySettingsBehaviourSubject.stream;

  BehaviorSubject<ShareEntitySettings> shareEntitySettingsBehaviourSubject;

  ShareEntitySettingsBloc({
    required this.shareEntity,
  })  : shareEntitySettingsBehaviourSubject =
            BehaviorSubject.seeded(_calculateInitialSettings(shareEntity)),
        super(isAllItemsInitialized: false) {
    shareEntitySettingsBehaviourSubject.disposeWith(this);

    wholeAsLinkBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.wholeAsLink,
    );
    addDisposable(wholeAsLinkBoolField);

    appendFromAccountBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.appendFromAccount,
    );
    addDisposable(appendFromAccountBoolField);

    mediaAsLinkBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.mediaAsLink,
    );
    addDisposable(mediaAsLinkBoolField);

    withCreatedAtBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.withCreatedAt,
    );
    addDisposable(withCreatedAtBoolField);

    withLinkBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.withLink,
    );
    addDisposable(withLinkBoolField);

    withMediaBoolField = BoolValueFormFieldBloc(
      originValue: shareEntitySettings.withMedia,
    );
    addDisposable(withMediaBoolField);

    withMessageStringField = StringValueFormFieldBloc(
      originValue: shareEntitySettings.withMessage ?? '',
      maxLength: null,
      validators: [],
    );
    addDisposable(withMessageStringField);

    withTextBoolField =
        BoolValueFormFieldBloc(originValue: shareEntitySettings.withText);
    addDisposable(withTextBoolField);

    onFormItemsChanged();

    for (final field in currentItems) {
      field.isSomethingChangedStream.listen(
        (_) {
          _updateSettingsFromFields();
        },
      ).disposeWith(this);
    }
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required ShareEntity shareEntity,
  }) =>
      DisposableProvider<IShareEntitySettingsBloc>(
        create: (context) => createFromContext(
          context,
          shareEntity: shareEntity,
        ),
        child: child,
      );

  static ShareEntitySettingsBloc createFromContext(
    BuildContext context, {
    required ShareEntity shareEntity,
  }) =>
      ShareEntitySettingsBloc(
        shareEntity: shareEntity,
      );

  void _updateSettingsFromFields() {
    shareEntitySettingsBehaviourSubject.add(
      ShareEntitySettings(
        appendFromAccount: appendFromAccountBoolField.currentValue,
        withCreatedAt: withCreatedAtBoolField.currentValue,
        withMedia: withMediaBoolField.currentValue,
        withText: withTextBoolField.currentValue,
        withLink: withLinkBoolField.currentValue,
        wholeAsLink: wholeAsLinkBoolField.currentValue,
        mediaAsLink: mediaAsLinkBoolField.currentValue,
        withMessage: withMessageStringField.currentValue,
      ),
    );
  }
}

ShareEntitySettings _calculateInitialSettings(ShareEntity shareEntity) =>
    ShareEntitySettings(
      appendFromAccount: shareEntity.isHaveFromAccount,
      withCreatedAt: shareEntity.isHaveCreatedAt,
      withMedia: shareEntity.isHaveMedia,
      withText: shareEntity.isHaveText,
      withLink: shareEntity.isHaveLink,
      wholeAsLink: false,
      mediaAsLink: false,
      withMessage: null,
    );
