import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_date_time_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/poll_status_option_form_string_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc.dart';
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
            expiresAtBloc: postStatusPollBloc.expiresAtFieldBloc),
      ],
    );
  }

  Widget buildMultiplyField(
          {@required BuildContext context,
          @required IFormBoolFieldBloc multiplyFieldBloc}) =>
      FormBoolFieldFormRowWidget(
        field: multiplyFieldBloc,
        label: "app.status.post.poll.field.multiply.label".tr(),
      );

  Widget buildPollLengthField(
          {@required BuildContext context,
          @required IFormDateTimeFieldBloc expiresAtBloc}) =>
      FormDateTimeFieldFormRowWidget(
        field: expiresAtBloc,
        label: "app.status.post.poll.field.length.label".tr(),
        popupTitle: "app.status.post.poll.field.length.picker.title".tr(),
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
                        child: PollStatusOptionFormStringFieldFormRowWidget(
                          formStringFieldBloc: pollItemBloc,
                          onSubmitted: (String value) {
                            var nextItem = items[index + 1];
                            nextItem.focusNode.requestFocus();
                          },
                          textInputAction: isLast
                              ? TextInputAction.done
                              : TextInputAction.next,
                          hint: "app.status.post.poll.field.option.hint"
                              .tr(args: [number.toString()]),
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

  FediIconButton buildAddItemIconButton(
      {@required
          IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc}) {
    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: FediColors.primary,
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
                ? FediColors.darkGrey
                : FediColors.lightGrey,
            onPressed: isPossibleToRemoveFields
                ? () {
                    pollOptionsGroupBloc.removeField(pollItemBloc);
                  }
                : null,
          );
        });
  }
}
