import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_navigation/Screens/full_menu.dart';
import 'package:restaurant_navigation/Utility/utils.dart';
import 'package:spring_button/spring_button.dart';

class TableMenu extends StatelessWidget {
  final table_index;

  TableMenu({Key key, this.table_index}) : super(key: key);

  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table No. ${table_index.toString()} - Current Order"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 86,
            child: ListView(
              children: <Widget>[
                CustomListTIle("Black Forest", "Rs. 55", Colorsbase.yellow),
                CustomListTIle("Brownie", "Rs. 90", Colorsbase.red),
                CustomListTIle("Paneer Sandwich", "Rs. 70", Colorsbase.yellow),
                CustomListTIle("Cheese Burger", "Rs. 65", Colorsbase.green),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: ListTile(
              title: Text("Total :"),
              trailing: Text("Rs. 355/-"),
            ),
          ),
          Expanded(
            flex: 6,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Text(
                    "Add More",
                    style: TextStyle(color: Colorsbase.white),
                  ))),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => FullMenu(currentTable: table_index)));
              },
              useCache: true,
//              alignment: Alignment.center,
              scaleCoefficient: 0.8,
            ),
          ),
        ],
      ),
    );
  }
  //
}

class CustomListTIle extends StatefulWidget {
  String name;
  String cost;
  Color color;

  CustomListTIle(this.name, this.cost, this.color);

  @override
  _CustomListTIleState createState() => _CustomListTIleState();
}

class _CustomListTIleState extends State<CustomListTIle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colorsbase.white, border: Border(left: BorderSide(color: widget.color, width: 5))),
      child: ListTile(
        title: Row(
          children: <Widget>[
//          Container(
//            height: 10,
//            width: 10,
//            decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
//          ),
//          SizedBox(
//            width: 10,
//          ),
            Text(widget.name),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("1  x  "),
            Text(widget.cost),
          ],
        ),
      ),
    );
  }
}
