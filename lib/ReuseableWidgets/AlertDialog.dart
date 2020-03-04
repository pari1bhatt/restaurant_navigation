import 'package:flutter/material.dart';

class CustomAlertDialog {
  final BuildContext context;
  final Widget widgets;

  CustomAlertDialog(this.context, this.widgets);

  openDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Review order",
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, animation1, animation2) => SizedBox.shrink(),
        transitionDuration: Duration(milliseconds: 200),
        transitionBuilder: (context, a1, a2, widget) => Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  content: Wrap(
                    children: <Widget>[widgets],
                  ),
                ),
              ),
            ));
  }
}
