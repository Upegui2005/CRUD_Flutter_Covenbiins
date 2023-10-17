import 'package:go_router/go_router.dart';

import '../../presentation/views/forgot_password/forgot_ password_view.dart';
import '../../presentation/views/home/home_view.dart';
import '../../presentation/views/login/login_view.dart';
import '../../presentation/views/register/register_view.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: LoginView.name,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterView.name,
      builder: (context, state) => RegisterView(),
    ),
    GoRoute(
        path: '/forgot_password_view',
        name: ForgotPasswordView.name,
        builder: (context, state) => ForgotPasswordView()
    ),
  ],
);