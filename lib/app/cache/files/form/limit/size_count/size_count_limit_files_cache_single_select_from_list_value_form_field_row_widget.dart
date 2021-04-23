import 'package:fedi/app/cache/files/cache/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<
            FilesCacheSizeLimitCountType>(
          label: S.of(context).app_cache_files_settings_sizeLimit_label,
          displayIconInRow: false,
          valueIconMapper: null,
          valueTitleMapper:
              (BuildContext context, FilesCacheSizeLimitCountType? value) {
            switch (value!) {
              case FilesCacheSizeLimitCountType.notSet:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_notSet;
              case FilesCacheSizeLimitCountType.size50:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size50;
              case FilesCacheSizeLimitCountType.size100:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size100;
              case FilesCacheSizeLimitCountType.size200:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size200;
              case FilesCacheSizeLimitCountType.size500:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size500;
              case FilesCacheSizeLimitCountType.size1000:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size1000;
              case FilesCacheSizeLimitCountType.size10000:
                return S
                    .of(context)
                    .app_cache_files_settings_sizeLimit_value_size10000;
            }
          },
          displayIconInDialog: false,
          description: null,
          descriptionOnDisabled: null,
        ),
      );

  const SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget();
}
