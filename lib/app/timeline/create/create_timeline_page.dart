import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc_impl.dart';
import 'package:fedi/app/timeline/create/create_timeline_widget.dart';
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
    var createTimelineBloc = ICreateTimelineBloc.of(context, listen: false);

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.create.title".tr(),
        actions: [
          StreamBuilder<bool>(
              stream: createTimelineBloc.isReadyToSubmitStream,
              initialData: createTimelineBloc.isReadyToSubmit,
              builder: (context, snapshot) {
                var isReadyToSubmit = snapshot.data;
                return AsyncOperationButtonBuilderWidget(
                  builder: (context, onPressed) => FediIconButton(
                    icon: Icon(Icons.check),
                    color: FediColors.darkGrey,
                    onPressed: isReadyToSubmit ? onPressed : null,
                  ),
                  asyncButtonAction: createTimelineBloc.save,
                );
              }),
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
      builder: (context) => DisposableProvider<ICreateTimelineBloc>(
        create: (context) => CreateTimelineBloc(),
        child: const CreateItemTimelinesHomeTabStoragePage(),
      ),
    );
