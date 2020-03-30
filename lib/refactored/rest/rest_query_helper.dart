String combineQueryArguments(Map<String, dynamic> keyToValueArgs) {
  return keyToValueArgs?.entries?.where((entry) =>
  entry.value
      ?.toString()
      ?.isNotEmpty == true)?.map((entry) => "${entry.key}=${entry.value}")
      ?.join("&");
}
