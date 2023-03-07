import 'package:flutter_real_time_chat/pages/chat_page.dart';
import 'package:flutter_real_time_chat/pages/loading_page.dart';
import 'package:flutter_real_time_chat/pages/login_page.dart';
import 'package:flutter_real_time_chat/pages/register_page.dart';
import 'package:flutter_real_time_chat/pages/users_page.dart';

final Map<String, dynamic> appRoutes = {
  'usuarios': (_) => UsersPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
