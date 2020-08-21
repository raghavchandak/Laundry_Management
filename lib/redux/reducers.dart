import 'package:nih_laundro/model/model.dart';
import 'package:nih_laundro/redux/actions.dart';

//! Creating simple functions for doing the desired activity when corresponding action is dispatched

AppState appStateReducer(AppState state, action) {
  return AppState(
    clothes: clothReducer(state.clothes, action),
  );
}

List<Cloth> clothReducer(List<Cloth> state, action) {
  //Make modifications and always return a LIST OF CLOTHES because that is what the state object holds

  if (action is IncreaseClothCount) {
    state[action.clothNo].count++;
    return []..addAll(state);
  }

  if (action is DecreaseClothCount) {
    if (state[action.clothNo].count > 0) {
      state[action.clothNo].count--;
    }
    return []..addAll(state);
  }

  if (action is ResetCount) {
    for (int i = 0; i < state.length; i++) {
      state[i].count = 0;
    }
    return []..addAll(state);
  }

  if (action is LoadedClothesAction) {
    return action.clothes;
  }

  return state;
}
