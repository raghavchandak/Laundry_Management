import 'package:nih_laundro/model/model.dart';
import 'package:nih_laundro/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    clothes: clothReducer(state.clothes, action),
  );
}

List<Cloth> clothReducer(List<Cloth> state, action) {
  if(action is IncreaseClothCount){
    state[0].count++;
    return []..addAll(state);
  }

  if(action is DecreaseClothCount){
    state[0].count--;
    return []..addAll(state);
  }

  return state;
}
