import 'package:flutter/material.dart';
import 'package:restaurant_navigation/Utility/utils.dart';

class BottomButtons extends StatelessWidget {
  final Function onSubmit;

  BottomButtons({Key key, this.onSubmit}) : super(key: key);

  final Color _lineColor = Colorsbase.black.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(border: Border.all(width: 0.5, color: _lineColor)),
        ),
        Material(
          color: Colors.transparent,
          child: Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
                    onTap: () {
                      Navigator.of(context).pop();
                      //onCancel();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Cancel", style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: _lineColor)),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
                    //onTap: onSubmit,
                    onTap: () {
                      onSubmit();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Confirm", style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
