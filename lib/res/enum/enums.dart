enum Request {
  get,
  post,
  put,
  patch,
  delete,
}

enum DayFilters {
  today('Today'),
  tomorrow('Tommorrow'),
  custom('Custom');

  const DayFilters(this.label);
  final String label;
}
