part of 'default.dart';

class RootVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  RootVariablesBuilder(this._dataConnect, );
  Deserializer<RootData> dataDeserializer = (dynamic json)  => RootData.fromJson(jsonDecode(json));
  
  Future<QueryResult<RootData, void>> execute() {
    return ref().execute();
  }

  QueryRef<RootData, void> ref() {
    
    return _dataConnect.query("Root", dataDeserializer, emptySerializer, null);
  }
}

class RootRoots {
  String title;
  RootRoots.fromJson(dynamic json):
  title = nativeFromJson<String>(json['title']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = nativeToJson<String>(title);
    return json;
  }

  RootRoots({
    required this.title,
  });
}

class RootData {
  List<RootRoots> roots;
  RootData.fromJson(dynamic json):
  roots = (json['roots'] as List<dynamic>)
        .map((e) => RootRoots.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['roots'] = roots.map((e) => e.toJson()).toList();
    return json;
  }

  RootData({
    required this.roots,
  });
}

