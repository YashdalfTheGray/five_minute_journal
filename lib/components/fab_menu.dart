import 'package:flutter/material.dart';

class FloatingActionButtonMenu extends StatefulWidget {
  final List<Widget> _actions;

  FloatingActionButtonMenu(actions) : _actions = actions {
    if (!(_actions.every((a) => a is FloatingActionButton && a.mini))) {
      throw new ArgumentError(
          'Each action should be of type FloatingActionButton and have the mini property set to true.');
    }
  }

  @override
  FloatingActionButtonMenuState createState() =>
      new FloatingActionButtonMenuState(_actions);
}

class FloatingActionButtonMenuState extends State<FloatingActionButtonMenu>
    with SingleTickerProviderStateMixin {
  final List<Widget> _actions;

  AnimationController _animationController;
  Animation<double> _iconAnimation;
  bool _isMenuVisible = false;

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

  handleMenuAnimate() {
    if (_isMenuVisible) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isMenuVisible = !_isMenuVisible;
  }

  Widget menuToggleButton() => new FloatingActionButton(
        onPressed: handleMenuAnimate,
        tooltip: 'Increment',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _iconAnimation,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _actions + <Widget>[menuToggleButton()],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
