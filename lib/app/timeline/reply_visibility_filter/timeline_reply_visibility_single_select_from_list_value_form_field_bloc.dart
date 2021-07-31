import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc
    implements
        ISingleSelectFromListValueFormFieldBloc<
            PleromaApiReplyVisibilityFilter?> {}
