class Search {
  static String search(
      {String q	, String limit}) {
    limit = limit == null ? "60" : limit;
    return "/api/v2/search?q=$q&limit=$limit&resolove=true&following=false";
  }
}