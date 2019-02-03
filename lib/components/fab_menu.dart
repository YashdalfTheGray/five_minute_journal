import 'package:flutter/material.dart';

class FloatingActionButtonMenu extends StatefulWidget {
  final List<FloatingActionButton> _actions;

  FloatingActionButtonMenu(actions) : _actions = actions;

  @override
  FloatingActionButtonMenuState createState() =>
      new FloatingActionButtonMenuState(_actions);
}

class FloatingActionButtonMenuState extends State<FloatingActionButtonMenu>
    with SingleTickerProviderStateMixin {
  final List<FloatingActionButton> _actions;

  FloatingActionButtonMenuState(actions) : _actions = actions;

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
