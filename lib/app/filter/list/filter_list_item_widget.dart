
import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("filter_list_item_widget.dart");

class FilterListItemWidget extends StatelessWidget {
  const FilterListItemWidget();

  @override
  Widget build(BuildContext context) {
    var filterBloc = IFilterBloc.of(context);

    _logger.finest(() => "build ${filterBloc.remoteId}");

    return Text("asd");
  }
}
