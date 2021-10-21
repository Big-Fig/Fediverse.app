import 'dart:async';

import 'package:flutter/cupertino.dart';

typedef DomainBlockCallback = FutureOr<void> Function(
  BuildContext context,
  DomainBlock domain,
);

class DomainBlock {
  final String domain;

  DomainBlock(this.domain);
}
