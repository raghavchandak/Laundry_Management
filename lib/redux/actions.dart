import 'package:nih_laundro/model/model.dart';

//! Defining the actions which will be dispatched

class IncreaseClothCount {
  final int clothNo;

  IncreaseClothCount({this.clothNo});
}

class DecreaseClothCount {
  final int clothNo;

  DecreaseClothCount({this.clothNo});
}

class ResetCount {}

class SaveClothesAction {}

class GetClothesAction {}

class LoadedClothesAction {
  final List<Cloth> clothes;

  LoadedClothesAction({this.clothes});
}

class SetPrefsVariable {}

class LoadedPrefsVariable {
  final bool isLoadedFromPrefs;

  LoadedPrefsVariable({this.isLoadedFromPrefs});
}

class ResetPrefsVariable {}
