import 'package:redux_example/model/app_state.dart';
import 'package:redux_example/model/data_model.dart';
import 'action.dart';

AppState appStateReducer(AppState state, dynamic action){
  if(action is AddItemAction){
    return addItem(state.data,action);
  } else if (action is ToogleItemStateAction){
    return toggleItemState(state.data, action);
  } else if (action is RemoveItemAction){
    return removeItem(state.data, action);
  } else if (action is ItemLoadedAction){
    return loadItems(action);
  }
  return state;
}

AppState addItem(List<Data> datas, AddItemAction action){
  return new AppState(List.from(datas)..add(action.data));
}

AppState toggleItemState(List<Data> datas, ToogleItemStateAction action) {
  return new AppState(
    datas.map((item) => item.keterangan == action.data.keterangan ? action.data : item).toList()
  );
}

AppState removeItem(List<Data> datas, RemoveItemAction action){
  return new AppState(
    List.from(datas)..removeWhere((item) => item.keterangan == action.data.keterangan)
  );
}

AppState loadItems(ItemLoadedAction action){
  return new AppState(action.datas);
}