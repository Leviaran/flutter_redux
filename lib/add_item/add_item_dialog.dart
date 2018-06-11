import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/model/data_model.dart';
import 'package:redux_example/model/app_state.dart';
import 'package:redux_example/redux/action.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef OnAddCallback = Function(String dataKeterangan);

class AddItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new StoreConnector<AppState, OnAddCallback>(
      converter: (store){
        return (dataketerangan) => 
        store.dispatch(AddItemAction(Data(dataketerangan, false)));
      }, builder: (context, callback) {
        return new AddItemDialogWidget(callback);
      },
    );
  }
}

class AddItemDialogWidget extends StatefulWidget {

  final OnAddCallback callback;

  AddItemDialogWidget(this.callback);

  @override
  State<StatefulWidget> createState() => new AddItemDialogWidgetState(callback);
}

class AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  String dataKeterangan;

  final OnAddCallback onAddCallback;

  AddItemDialogWidgetState(this.onAddCallback);

  @override
  Widget build(BuildContext context){
    return new AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                labelText: 'data keterangan', hintText: 'contoh Menari',
              ),
              onChanged: _handleTextChanged,
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          child: const Text("cancel"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        new FlatButton(
          child: const Text("Add"),
          onPressed: (){
            Navigator.pop(context);
            onAddCallback(dataKeterangan);
          },
        )
      ],
    );
  }

  _handleTextChanged(String newStringData){
    setState(() {
          dataKeterangan = newStringData;
        });
  }
}