class ListInterface {
  final int? id;
  final String title;
  final String content;
  final bool? checkBox;
  final int position;

  ListInterface({
    this.id,
    required this.title,
    required this.content,
    this.checkBox,
    required this.position,
  });

  factory ListInterface.fromMap(Map<String, dynamic> json) => ListInterface(
      id: json['i'],
      title: json['title'],
      content: json['content'],
      checkBox: json['checkBox'] == 'false' ? false : true,
      position: json['position'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'checkBox': checkBox.toString(),
      'position' : position,
    };
  }
}
