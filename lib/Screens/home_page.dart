import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nih_laundro/Widgets/Reusable%20Card/reusable_card.dart';
import 'package:nih_laundro/Widgets/done_button.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:redux/redux.dart';

import 'package:nih_laundro/Screens/display_screen.dart';

class HomePage extends StatelessWidget {
  final Store<AppState> store;

  const HomePage({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Management'),
        centerTitle: true,
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
