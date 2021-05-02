enum PendingState {
  notSentYet,
  published,
  pending,
  fail,
}

const _notSenYetPendingStateJsonValue = "notSentYet";
const _publishedPendingStateJsonValue = "published";
const _pendingPendingStateJsonValue = "pending";
const _failPendingStateJsonValue = "fail";

extension PendingStateExtension on PendingState {
  String toJsonValue() {
    String result;

    switch (this) {
      case PendingState.notSentYet:
        result = _notSenYetPendingStateJsonValue;
        break;
      case PendingState.pending:
        result = _pendingPendingStateJsonValue;
        break;
      case PendingState.published:
        result = _publishedPendingStateJsonValue;
        break;
      case PendingState.fail:
        result = _failPendingStateJsonValue;
        break;
    }

    return result;
  }
}

extension PendingStateStringExtension on String {
  PendingState toPendingState() {
    PendingState result;

    switch (this) {
      case _notSenYetPendingStateJsonValue:
        result = PendingState.notSentYet;
        break;
      case _publishedPendingStateJsonValue:
        result = PendingState.published;
        break;
      case _pendingPendingStateJsonValue:
        result = PendingState.pending;
        break;
      case _failPendingStateJsonValue:
        result = PendingState.fail;
        break;
      // can't parse
      default:
        throw "Invalid PendingState $PendingState";
    }

    return result;
  }
}
