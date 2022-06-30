
final List<String> _filters = [];

setLogFilters(List<String> filters) {
  _filters.clear();
  _filters.addAll(filters);
}

log(dynamic message, [String section = 'debug']) {
  final doPrint = _filters.every((element) => section.contains(element));
  if (doPrint) {
    print('[${section}] $message');
  }
}
