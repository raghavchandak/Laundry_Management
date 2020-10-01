import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:nih_laundro/redux/actions.dart';
import 'package:redux/redux.dart';

class SaveButton extends StatelessWidget {
  final Store<AppState> store;

  int getTotal() {
    int total = 0;

    for (int i = 0; i < store.state.clothes.length; i++) {
      total += store.state.clothes[i].count * store.state.clothes[i].price;
    }

    return total;
  }

  void dispatchOnSaveClothes() {
    store.dispatch(SetPrefsVariable());
    store.dispatch(SaveClothesAction());
  }

  const SaveButton({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        height: 45.0,
        width: MediaQuery.of(context).size.width * 1,
        color: Color(0xFF2282B9),
        child: Row(
          children: <Widget>[
            Icon(EvilIcons.chevron_right, size: 25.0, color: Colors.white),
            Icon(EvilIcons.chevron_right, size: 25.0, color: Colors.white),
            Icon(EvilIcons.chevron_right, size: 25.0, color: Colors.white),
            Center(
              child: Text(
                'Total : Rs. ${getTotal().toString()} + Miscellanous',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Save',
          color: Color(0xFF4EB44B),
          icon: Icons.check,
          foregroundColor: Colors.white,
          onTap: () => dispatchOnSaveClothes(),
        ),
      ],
    );
  }
}
