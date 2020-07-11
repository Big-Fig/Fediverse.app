import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/field/account_field_grid_item_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountFieldGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<List<IPleromaField>>(
        stream: accountBloc.fieldsStream,
        initialData: accountBloc.fields,
        builder: (context, snapshot) {
          var fields = snapshot.data;

          var nonEmptyFields = fields?.where((field) =>
              field?.name?.isNotEmpty == true ||
              field?.value?.isNotEmpty == true);

          if (nonEmptyFields?.isNotEmpty == true) {
            return GridView.count(
                padding: FediPadding.allBigPadding,
                shrinkWrap: true,
                childAspectRatio: 4,
                crossAxisCount: 2,
                crossAxisSpacing: FediSizes.smallPadding,
                mainAxisSpacing: FediSizes.smallPadding,
                children: nonEmptyFields
                // hack to avoid fill parent inside GridView
                    .map((field) => Column(
                      children: [
                        Container(
                          height: FediSizes.textButtonHeight,
                          child: AccountFieldGridItemWidget(field: field),
                        ),
                      ],
                    ))
                    .toList());
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const AccountFieldGridWidget();
}
