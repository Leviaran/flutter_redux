import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/model/app_state.dart';
import 'package:redux_example/model/data_model.dart';
import 'package:redux_example/redux/action.dart';

typedef OnStateChanged = Function(Data data);
typedef onRemoveIconClicked = Function(Data data);

class ListItem extends StatelessWidget {

  final Data data;
  ListItem(this.data);

  @override
  Widget build(BuildContext context){
    return new ListTile(
      title: new Text(data.keterangan),
      leading: new StoreConnector<AppState, OnStateChanged>(converter: (store) {
        return (item) => store.dispatch(ToogleItemStateAction(item));
      },builder: (context, callback) {
        return new Checkbox(
          value: data.checked,
          onChanged: (bool value) {
            callback(Data(data.keterangan, value));
          },
        );
      }),
      trailing: new StoreConnector<AppState, onRemoveIconClicked>(
        converter: (store){
          return (item) => store.dispatch(RemoveItemAction(item));
        },
        builder: (context, callback){
          return new IconButton(
            icon: new Icon(Icons.delete),
            onPressed: () {
              callback(Data(data.keterangan,data.checked));
            },
          );
        },
      ),
    );
  }
}