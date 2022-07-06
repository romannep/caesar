
const Map<String, List<String>> TERMS = {
  'desktop': ['Рабочий стол', 'Desktop'],
  't1': ['', ''],
  't2': ['', ''],
  't3': ['', ''],
  't4': ['', ''],
  't5': ['', ''],
  't6': ['', ''],
};

int language = 0;

final t = (String term) => TERMS[term] == null ? 'ADD TERM' : TERMS[term]![language];
