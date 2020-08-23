import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nih_laundro/model/model.dart';
import 'package:nih_laundro/redux/actions.dart';

void saveToPrefs(AppState state) async {
  print('Saving!');
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await sharedPreferences.setString('clothesState', string);
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var string = sharedPreferences.getString('clothesState');
  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }
  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher nextDispatcher) async {
  nextDispatcher(action);

  if (action is SaveClothesAction || action is ResetCount) {
    saveToPrefs(store.state);
  }

  if (action is GetClothesAction) {
    await loadFromPrefs().then(
      (state) => store.dispatch(
        LoadedClothesAction(clothes: state.clothes),
      ),
    );
  }
}
