import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nih_laundro/Widgets/done_button.dart';
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

    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Laundry Management',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Management'),
      ),
      body: StoreConnector<AppState, ViewModel>(
        //! converter function converts the store into a Viewmodel
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewmodel) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewmodel.clothes.length,
                itemBuilder: (BuildContext ctxt, int i) {
                  return ReusableCard(
                    model: viewmodel,
                    clothNo: i,
                  );
                },
              ),
            ),
            DoneButton(
              text: 'Done',
              onPressed: () => toDisplayScreen(context, viewmodel),
            ),
          ],
        ),
      ),
    );
  }
}

void toDisplayScreen(BuildContext context, ViewModel model) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => DisplayScreen(
        model: model,
      ),
    ),
  );
}

//! Model of what is to be exposed to the UI, connection between the store and the UI
class ViewModel {
  final List<Cloth> clothes;
  final Function(int) onIncreaseCloth;
  final Function(int) onDecreaseCloth;
  final Function() onResetClothCount;

  ViewModel(
      {this.clothes,
      this.onIncreaseCloth,
      this.onDecreaseCloth,
      this.onResetClothCount});

  factory ViewModel.create(Store<AppState> store) {
    _onIncreaseCloth(int clothNo) {
      store.dispatch(IncreaseClothCount(clothNo: clothNo));
    }

    _onDecreaseCloth(int clothNo) {
      store.dispatch(DecreaseClothCount(clothNo: clothNo));
    }

    _onResetClothCount() {
      store.dispatch(ResetCount());
    }

    return ViewModel(
        clothes: store.state.clothes,
        onIncreaseCloth: _onIncreaseCloth,
        onDecreaseCloth: _onDecreaseCloth,
        onResetClothCount: _onResetClothCount);
  }
}
