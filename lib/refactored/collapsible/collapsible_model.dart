abstract class ICollapsibleItem {


  bool get isNeedShowFullContent;
  Stream<bool> get isNeedShowFullContentStream;


  bool get isPossibleToCollapse;
  Stream<bool> get isPossibleToCollapseStream;

  bool get isCollapsed;

  Stream<bool> get isCollapsedStream;

  void toggleCollapseExpand();

  void collapse();
}
