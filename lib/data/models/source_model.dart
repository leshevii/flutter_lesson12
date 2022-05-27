class SourceModel {
  String? id;
  String name;
  SourceModel(this.id, this.name);
  factory SourceModel.fromJson(Map<String, dynamic> map) {
    return SourceModel(map['id'], map['name']);
  }
}
