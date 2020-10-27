import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_duration_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_option_form_string_field_form_row_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPollWidget extends StatelessWidget {
  PostStatusPollWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusPollBloc = IPostStatusPollBloc.of(context, listen: false);

    return Column(
      children: <Widget>[
        buildPollOptionFields(
            context: context,
            pollOptionsGroupBloc: postStatusPollBloc.pollOptionsGroupBloc),
        buildMultiplyField(
            context: context,
            multiplyFieldBloc: postStatusPollBloc.multiplyFieldBloc),
        buildPollLengthField(
            context: context,
            lengthBloc: postStatusPollBloc.durationLengthFieldBloc),
      ],
    );
  }

  Widget buildMultiplyField(
          {@required BuildContext context,
          @required IFormBoolFieldBloc multiplyFieldBloc}) =>
      FormBoolFieldFormRowWidget(
        field: multiplyFieldBloc,
        label: S.of(context).app_status_post_poll_field_multiply_label,
      );

  Widget buildPollLengthField(
          {@required BuildContext context,
          @required IFormDurationFieldBloc lengthBloc}) =>
      FormDurationFieldFormRowWidget(
        field: lengthBloc,
        label: S.of(context).app_status_post_poll_field_length_label,
        popupTitle: S.of(context).app_status_post_poll_field_length_picker_title,
      );

  Widget buildPollOptionFields(
      {@required
          BuildContext context,
      @required
          IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc}) {
    return StreamBuilder<List<IFormStringFieldBloc>>(
        stream: pollOptionsGroupBloc.itemsStream,
        initialData: pollOptionsGroupBloc.items,
        builder: (context, snapshot) {
          var items = snapshot.data;

          return Column(
            children: [
              ...items.asMap().entries.map((entry) {
                var index = entry.key;
                var pollItemBloc = entry.value;
                var number = index + 1;
                var isLast = items.length == number;
                return Padding(
                  padding: EdgeInsets.only(top: FediSizes.mediumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: PostStatusPollOptionFormStringFieldFormRowWidget(
                          formStringFieldBloc: pollItemBloc,
                          onSubmitted: (String value) {
                            var nextItem = items[index + 1];
                            nextItem.focusNode.requestFocus();
                          },
                          textInputAction: isLast
                              ? TextInputAction.done
                              : TextInputAction.next,

                          hint: S.of(context).app_status_post_poll_field_option_hint(number.toString()),
                        ),
                      ),
                      if (!isLast)
                        buildRemoveItemIconButton(
                            pollOptionsGroupBloc: pollOptionsGroupBloc,
                            pollItemBloc: pollItemBloc),
                      if (isLast)
                        StreamBuilder<bool>(
                            stream: pollOptionsGroupBloc
                                .isMaximumFieldsCountReachedStream,
                            initialData: pollOptionsGroupBloc
                                .isMaximumFieldsCountReached,
                            builder: (context, snapshot) {
                              var isMaximumFieldsCountReached = snapshot.data;
                              if (isMaximumFieldsCountReached) {
                                return buildRemoveItemIconButton(
                                  pollOptionsGroupBloc: pollOptionsGroupBloc,
                                  pollItemBloc: pollItemBloc,
                                );
                              } else {
                                return buildAddItemIconButton(
                                  context: context,
                                  pollOptionsGroupBloc: pollOptionsGroupBloc,
                                );
                              }
                            })
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        });
  }

  FediIconButton buildAddItemIconButton({
    @required BuildContext context,
    @required IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc,
  }) {
    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: IFediUiColorTheme.of(context).primary,
      onPressed: () {
        pollOptionsGroupBloc.addNewEmptyField();
      },
    );
  }

  StreamBuilder<bool> buildRemoveItemIconButton({
    @required IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc,
    @required IFormStringFieldBloc pollItemBloc,
  }) {
    return StreamBuilder<bool>(
        stream: pollOptionsGroupBloc.isPossibleToRemoveFieldsStream,
        initialData: pollOptionsGroupBloc.isPossibleToRemoveFields,
        builder: (context, snapshot) {
          var isPossibleToRemoveFields = snapshot.data;
          return FediIconButton(
            icon: Icon(FediIcons.remove),
            color: isPossibleToRemoveFields
                ? IFediUiColorTheme.of(context).darkGrey
                : IFediUiColorTheme.of(context).lightGrey,
            onPressed: isPossibleToRemoveFields
                ? () {
                    pollOptionsGroupBloc.removeField(pollItemBloc);
                  }
                : null,
          );
        });
  }
}
