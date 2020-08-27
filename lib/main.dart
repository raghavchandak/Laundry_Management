import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nih_laundro/Widgets/done_button.dart';
import 'package:nih_laundro/redux/middleware.dart';
import 'package:redux/redux.dart';

import 'Screens/display_screen.dart';
import 'Widgets/Reusable Card/reusable_card.dart';
import 'redux/actions.dart';
import 'redux/reducers.dart';
import 'model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //! Creating the store which holds the AppState object, and wrapping the entire app with the StoreProvider

    final Store<AppState> store = Store<AppState>(appStateReducer,
        initialState: AppState.initialState(),
        middleware: [appStateMiddleware]);

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Laundry Management',
        home: StoreBuilder<AppState>(
          onInit: (store) {
            store.dispatch(
              GetClothesAction(),
            );
            print(store.state.isLoadedFromPrefs);
          },
          builder: (BuildContext context, Store<AppState> store) =>
              store.state.isLoadedFromPrefs
                  ? DisplayScreen(
                      store: store,
                    )
                  : HomePage(
                      store: store,
                    ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Store<AppState> store;

  const HomePage({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Management'),
      ),
      body: StoreConnector<AppState, List<Cloth>>(
        //! converter function converts the store into a Viewmodel
        converter: (Store<AppState> store) => store.state.clothes,
        builder: (BuildContext context, List<Cloth> clothes) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: clothes.length,
                itemBuilder: (BuildContext ctxt, int i) {
                  return ReusableCard(
                    clothes: clothes,
                    store: store,
                    clothNo: i,
                  );
                },
              ),
            ),
            DoneButton(
              text: 'Done',
              onPressed: () => toDisplayScreen(context, store),
            ),
          ],
        ),
      ),
    );
  }
}

void toDisplayScreen(BuildContext context, Store<AppState> store) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => DisplayScreen(
        store: store,
      ),
    ),
  );
}
