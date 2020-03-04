import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_navigation/ReuseableWidgets/AlertDialog.dart';
import 'package:restaurant_navigation/ReuseableWidgets/bottom_buttons.dart';
import 'package:restaurant_navigation/Utility/utils.dart';
import 'package:restaurant_navigation/model/food_item_model.dart';
import 'package:spring_button/spring_button.dart';

class FullMenu extends StatefulWidget {
  final currentTable;

  FullMenu({Key key, this.currentTable}) : super(key: key);

  @override
  _FullMenuState createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  //
  String SelectedHeading = "ALL";
  List<FoodItem> currentList = Utils.fooditems_all;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu - Table ${widget.currentTable.toString()}"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 40,
            child: TextField(
              decoration: InputDecoration(prefixIcon: Icon(Icons.search), isDense: false, hintText: "Search"),
            ),
          ),
          Expanded(
            flex: 94,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IntrinsicWidth(
                  child: Container(
//                      width: 100,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Utils.itemHead.asMap().entries.map((map) => Headings(map.key)).toList(),
                  )),
                ),
                VerticalDivider(
                  width: 0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12.withOpacity(0.02),
                    child: ListView.builder(
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        return SingleFoodTile(
                          index: index,
                          list: currentList,
                        );
                      },
                    ),
                  ),
                )
              ],
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
                  alignment: Alignment.center,
                  child: Text(
                    "Review Order",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              onTap: () {
                List<FoodItem> _orderItems = [];
                int total = 0;
                for (var value in Utils.fooditems_all) {
                  if (value.quantity > 0) {
                    _orderItems.add(value);
                    total += value.quantity * value.cost;
                  }
                }
                CustomAlertDialog(context, DialogWidgetData(orderItems: _orderItems, total: total)).openDialog();
              },
              useCache: true,
//              alignment: Alignment.center,
              scaleCoefficient: 0.8,
            ),
          )
        ],
      ),
    );
  }

  //
  Widget Headings(index) {
    //
    return InkWell(
      onTap: () {
        setState(() {
          SelectedHeading = Utils.itemHead[index];
          if (SelectedHeading == Utils.itemHead[1]) {
            currentList = Utils.fooditems_all.sublist(0, 5);
          } else if (SelectedHeading == Utils.itemHead[2]) {
            currentList = Utils.fooditems_all.sublist(5, 11);
          } else if (SelectedHeading == Utils.itemHead[3]) {
            currentList = Utils.fooditems_all.sublist(11, 15);
          } else if (SelectedHeading == Utils.itemHead[4]) {
            currentList = Utils.fooditems_all.sublist(15, 22);
          } else if (SelectedHeading == Utils.itemHead[5]) {
            currentList = Utils.fooditems_all.sublist(22, 26);
          } else if (SelectedHeading == Utils.itemHead[6]) {
            currentList = Utils.fooditems_all.sublist(26, 30);
          } else {
            currentList = Utils.fooditems_all;
          }
        });
      },
      child: Container(
        width: double.infinity,
        color: colorpick2(Utils.itemHead[index]),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Text(
          Utils.itemHead[index],
          style: TextStyle(fontSize: 12, color: colorpick(Utils.itemHead[index]) ?? Colorsbase.black),
        ),
      ),
    );
    //
  }

  //
  Color colorpick(name) {
    if (SelectedHeading == name) {
      return Theme.of(context).primaryColor;
    } else
      return Colorsbase.black;
  }

  //
  Color colorpick2(name) {
    if (SelectedHeading == name) {
      return Theme.of(context).primaryColor.withOpacity(0.1);
    } else
      return Colorsbase.white;
  }
}

//
//
class SingleFoodTile extends StatefulWidget {
  final index;
  final List<FoodItem> list;

  SingleFoodTile({Key key, this.index, this.list}) : super(key: key);
  @override
  _SingleFoodTileState createState() => _SingleFoodTileState();
}

class _SingleFoodTileState extends State<SingleFoodTile> {
//  TextEditingController _controller = new TextEditingController();
  //
  void remove() {
    setState(() {
      if (widget.list[widget.index].quantity != 0) widget.list[widget.index].quantity--;
    });
  }

  void add() {
    setState(() {
      widget.list[widget.index].quantity++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            contentPadding: EdgeInsets.only(right: 10, left: 5),
            title: Text(widget.list[widget.index].name),
            subtitle: Text("Rs. ${widget.list[widget.index].cost.toString()}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /*     Container(
                  width: 80,
                  height: 50,
                  child: StepperTouch(
                    initialValue: 0,
                    direction: Axis.horizontal,
                    withSpring: false,
                    onChanged: (int value) {
                      print("Final value: ${value}");
                      widget.list[widget.index].quantity = value;
                      print("item: ${widget.list[widget.index].name}, Quantity: ${widget.list[widget.index].quantity}");
                    },
                  ),
                )*/
                CustomRoundButton(Icons.remove, remove),
                Container(
                  height: 25,
                  width: 25,
                  alignment: Alignment.center,
                  child: Text(
                    widget.list[widget.index].quantity.toString(),
                  ),
                ),
/*                Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    maxLength: 2,
                    inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
//                    textInputAction: TextInputAction.done,
                    controller: _controller,
                    onChanged: (value) {
                      _n = int.parse(value);
                      print("value: $value, integer: $_n");
                    },
                    decoration: InputDecoration(counterText: "", border: InputBorder.none, hintStyle: TextStyle(fontSize: 13), hintText: "0"),
                  ),
                )*/
                CustomRoundButton(Icons.add, add),
              ],
            ),
            dense: true),
        Divider(
          height: 1,
        )
      ],
    );
  }

  Widget CustomRoundButton(icon, onPressed) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)], shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 15,
        padding: EdgeInsets.zero,
        icon: Icon(icon),
      ),
    );
  }
  //
}

//
//
//
class DialogWidgetData extends StatelessWidget {
  final List<FoodItem> orderItems;
  final total;

  DialogWidgetData({Key key, this.orderItems, this.total}) : super(key: key);

  TextStyle textStyle = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context) {
//    print("ordered list: ${orderItems[1].quantity}");

    return Wrap(
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          child: Text(
            "Order Summary",
            style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
          ),
        ),
        Divider(
          height: 1,
        ),
        Column(
          children: orderItems
              .asMap()
              .entries
              .map((map) => commmonRow(map.key)
/*              Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(
                                orderItems[map.key].name,
                                style: textStyle,
                              ),
                            ),
                            Text(
                              "${orderItems[map.key].quantity.toString()}  x",
                              style: textStyle,
                            ),
                            Text(
                              "Rs. ${orderItems[map.key].cost.toString()}",
                              style: textStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  )*/
                  )
              .toList(),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 8),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Total : "),
              Text("Rs. $total"),
            ],
          ),
        ),
        BottomButtons(
          onSubmit: () {
            print("something clicked");
          },
        ),
      ],
    );
  }

  Widget commmonRow(index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      dense: true,
      title: Text(
        orderItems[index].name,
        style: textStyle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("${orderItems[index].quantity.toString()}  x  "),
          Container(width: 60, alignment: Alignment.centerRight, child: Text("Rs. ${orderItems[index].cost.toString()}")),
        ],
      ),
    );
  }
}
