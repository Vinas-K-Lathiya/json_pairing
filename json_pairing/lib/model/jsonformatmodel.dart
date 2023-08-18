class jsonmodel {
  int id;
  String bhagvatgitaslok;
  String english;
  String hindi;
  String gujrati;
  String adhyay;

  jsonmodel({
    required this.id,
    required this.bhagvatgitaslok,
    required this.english,
    required this.hindi,
    required this.gujrati,
    required this.adhyay,
  });

  factory jsonmodel.fromjson({required Map Data}) {
    return jsonmodel(
        id: Data['id'],
        bhagvatgitaslok: Data['bhagavad gita slok'],
        english: Data['english translate'],
        hindi: Data['hindi translate'],
        gujrati: Data['gujarati translate'],
        adhyay: Data['adhyay']);
  }
}
