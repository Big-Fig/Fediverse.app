import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateItemTimelinesHomeTabStoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var createItemTimelinesHomeTabStorageBloc =
    ICreateItemTimelinesHomeTabStorageBloc.of(context, listen: false);

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.create.title".tr(),
        actions: [
          StreamBuilder<bool>(
              stream: createItemTimelinesHomeTabStorageBloc.isReadyToSubmitStream,
              initialData: createItemTimelinesHomeTabStorageBloc.isReadyToSubmit,
              builder: (context, snapshot) {
                var isReadyToSubmit = snapshot.data;
                return AsyncOperationButtonBuilderWidget(
                  builder: (context, onPressed) =>
                      FediIconButton(
                        icon: Icon(Icons.check),
                        color: FediColors.darkGrey,
                        onPressed: isReadyToSubmit ? onPressed : null,
                      ),
                  asyncButtonAction: createItemTimelinesHomeTabStorageBloc.save,
                );
              }
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: CreateItemTimelinesHomeTabStorageWidget(),
        ),
      ),
    );
  }

  const CreateItemTimelinesHomeTabStoragePage();
}

void goToCreateItemTimelinesHomeTabStoragePage(BuildContext context) {
  Navigator.push(
    context,
    createCreateItemTimelinesHomeTabStoragePageRoute(),
  );
}

MaterialPageRoute createCreateItemTimelinesHomeTabStoragePageRoute() =>
    MaterialPageRoute(
      builder: (context) =>
          DisposableProvider<ICreateItemTimelinesHomeTabStorageBloc>(
            create: (context) => CreateItemTimelinesHomeTabStorageBloc(),
            child: const CreateItemTimelinesHomeTabStoragePage(),),
    );
