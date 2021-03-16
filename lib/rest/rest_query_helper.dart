extension KeyToValueArgsExtension on Map<String, dynamic> {
  String combineQueryArguments() {
    return entries
        .where((entry) => entry.value.toString().isNotEmpty == true)
        .map((entry) => "${entry.key}=${entry.value}")
        .join("&");
  }
}
