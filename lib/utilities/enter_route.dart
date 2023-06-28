import 'package:flutter/material.dart';

// This is a transition Builder for pages to unify the transition for both iPhone and Andriod
// transition is from left to right
// to change the transition for arabic version adjest this method, SlideTransition()
class EnterRoute extends PageRouteBuilder {
  final Widget enterPage;

  EnterRoute({required this.enterPage})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                enterPage,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ));
}

class ExitRout extends PageRouteBuilder {
  final Widget exitPage;

  ExitRout({required this.exitPage})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                exitPage,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(-1.0, 0.0),
                  ).animate(animation),
                  child: child,
                ));
}
