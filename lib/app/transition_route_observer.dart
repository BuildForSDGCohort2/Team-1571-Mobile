import 'package:flutter/material.dart';

class TransitionRouteObserver<R extends TransitionRoute<dynamic>>
    extends NavigatorObserver {
  final Map<R, Set<TransitionRouteAware>> _listeners =
      <R, Set<TransitionRouteAware>>{};


  void subscribe(TransitionRouteAware routeAware, R route) {
    assert(routeAware != null);
    assert(route != null);
    final Set<TransitionRouteAware> subscribers =
        _listeners.putIfAbsent(route, () => <TransitionRouteAware>{});
    if (subscribers.add(routeAware)) {
      routeAware.didPush();
      Future.delayed(route.transitionDuration, () {
        routeAware.didPushAfterTransition();
      });
    }
  }

 
  ///
 
  /// subscribed to multiple types, this will unregister it (once) from each type.
  void unsubscribe(TransitionRouteAware routeAware) {
    assert(routeAware != null);
    for (R route in _listeners.keys) {
      final Set<TransitionRouteAware> subscribers = _listeners[route];
      subscribers?.remove(routeAware);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final List<TransitionRouteAware> previousSubscribers =
          _listeners[previousRoute]?.toList();

      if (previousSubscribers != null) {
        for (TransitionRouteAware routeAware in previousSubscribers) {
          routeAware.didPopNext();
        }
      }

      final List<TransitionRouteAware> subscribers =
          _listeners[route]?.toList();

      if (subscribers != null) {
        for (TransitionRouteAware routeAware in subscribers) {
          routeAware.didPop();
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final Set<TransitionRouteAware> previousSubscribers =
          _listeners[previousRoute];

      if (previousSubscribers != null) {
        for (TransitionRouteAware routeAware in previousSubscribers) {
          routeAware.didPushNext();
        }
      }
    }
  }
}


abstract class TransitionRouteAware {
  /// Called when the top route has been popped off, and the current route
  /// shows up.
  void didPopNext() {}

  /// Called when the current route has been pushed.
  void didPush() {}

  /// Called when the current route has been pushed and finished transition.
  void didPushAfterTransition() {}

  /// Called when the current route has been popped off.
  void didPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void didPushNext() {}
}