import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/field/account_field_list_item_widget.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountFieldListWidget extends StatelessWidget {
  final Brightness brightness;

  const AccountFieldListWidget({
    Key? key,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<List<IUnifediApiField>>(
      stream: accountBloc.fieldsStream,
      builder: (context, snapshot) {
        var fields = snapshot.data;

        var nonEmptyFields = fields?.where(
          (field) =>
              field.name?.isNotEmpty == true || field.value?.isNotEmpty == true,
        );

        if (nonEmptyFields?.isNotEmpty == true) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: FediSizes.smallPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: nonEmptyFields!
                  // hack to avoid fill parent inside GridView
                  .map(
                    (field) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: FediSizes.smallPadding),
                      child: AccountFieldListItemWidget(
                        field: field,
                        brightness: brightness,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
