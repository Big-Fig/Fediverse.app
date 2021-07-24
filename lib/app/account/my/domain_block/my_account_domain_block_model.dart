import 'package:flutter/cupertino.dart';

typedef DomainBlockCallback = Function(
  BuildContext context,
  DomainBlock domain,
);

class DomainBlock {
  final String domain;

  DomainBlock(this.domain);
}
