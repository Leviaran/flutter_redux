import 'package:flutter/material.dart';
import 'package:redux_example/model/app_state.dart';
import 'package:redux_example/model/data_model.dart';
import 'package:redux_example/redux/action.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'list_item.dart';

class ListData extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new StoreConnector<AppState, List<Data>>(
      converter: (store) => store.state.data,
      builder: (context, list){
        return new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => new ListItem(list[position])
        );
      },
    );
  }
}

