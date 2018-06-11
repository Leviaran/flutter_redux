import 'data_model.dart';

class AppState {
  static var empty = AppState(new List());

  final List<Data> data;

  AppState(this.data);

  AppState.fromJson(Map<String, dynamic> json) 
        : data = (json['data'] as List)
        .map((i) => new Data.fromJson(i as Map<String, dynamic>))
        .toList();

  Map<String, dynamic> toJson() => {'data': data};

  @override
  String toString() => "$data"; 

}