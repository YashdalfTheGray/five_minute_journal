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

  AnimationController _animationController;
  Animation<double> _iconAnimation;

  FloatingActionButtonMenuState(actions) : _actions = actions;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });

    _iconAnimation =
        new Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _iconAnimation,
      ),
    );
  }
}
