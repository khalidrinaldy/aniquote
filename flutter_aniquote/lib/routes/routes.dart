import 'package:flutter/material.dart';
import 'package:flutter_aniquote/views/about_screen.dart';
import 'package:flutter_aniquote/views/detail_title.dart';
import 'package:flutter_aniquote/views/explore_title.dart';
import 'package:flutter_aniquote/views/home_screen.dart';
import 'package:flutter_aniquote/views/login_screen.dart';
import 'package:flutter_aniquote/views/register_screen.dart';
import 'package:flutter_aniquote/views/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/explore':
        return MaterialPageRoute(builder: (_) => ExploreTitle());
        break;
      case '/detail':
        return MaterialPageRoute(builder: (_) => DetailTitle(args));
        break;
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutScreen());
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error"),),
        body: Center(child: Text("Error Page"),),
      );
    });
  }
}