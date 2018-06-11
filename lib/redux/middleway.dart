import 'dart:async';
import 'dart:convert';

import 'package:redux_example/model/app_state.dart';
import 'action.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_STATE_KEY = "APP_STATE";

void storeDataItemMiddleware(Store<AppState> store, action, NextDispatcher next){
  next(action);

  if(action is AddItemAction ||
  action is ToogleItemStateAction ||
  action is RemoveItemAction) {
    saveStateToPrefs(store.state);
  }

  if(action is FetchItemAction){
    loadStateFromPrefs().then((state) {
      store.dispatch(new ItemLoadedAction(state.data));
    });
  }
}

void saveStateToPrefs(AppState state) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var stateString = json.encode(state.toJson());
    await sharedPreferences.setString(APP_STATE_KEY, stateString);
  }

  Future<AppState> loadStateFromPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var stateString = sharedPreferences.getString(APP_STATE_KEY);
    Map stateMap = json.decode(stateString);
    return new AppState.fromJson(stateMap);
  }
