import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nih_laundro/Screens/home_page.dart';
import 'package:nih_laundro/redux/middleware.dart';
import 'package:redux/redux.dart';

import 'Screens/display_screen.dart';
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
