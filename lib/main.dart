import 'package:redux_example/util/all_library.dart';


void main(){
  runApp(new DataTodoApp());
}

class DataTodoApp extends StatelessWidget {
  final store = new DevToolsStore<AppState>(
    appStateReducer, initialState: AppState.empty, middleware: [storeDataItemMiddleware]
  );

  @override
  Widget build(BuildContext context){
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'TodoList',
        theme: new ThemeData(
          primarySwatch: Colors.blue
        ),
        home: new StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(new FetchItemAction()),
          builder: (context, store) => new DataTodo(store),
        ),
      ),
    );
  }
}

class DataTodo extends StatelessWidget {
  final DevToolsStore<AppState> store;

  DataTodo(this.store);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Todo"),
      ),
      body: new ListData(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: new Icon(Icons.add),
      ),
      endDrawer: new Container(
        width: 240.0, color: Colors.white,child: new ReduxDevTools(store),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context){
  showDialog(context: context, builder: (context) => new AddItemDialog());
}


