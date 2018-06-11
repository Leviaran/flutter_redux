import 'package:redux_example/model/data_model.dart';

class AddItemAction{
  final Data data;
  
  AddItemAction(this.data);

}

class ToogleItemStateAction{

  final Data data;

  ToogleItemStateAction(this.data);

}

class FetchItemAction{}

class ItemLoadedAction{
  final List<Data> datas;

  ItemLoadedAction(this.datas);

}

class RemoveItemAction{

  final Data data;

  RemoveItemAction(this.data);
  
}