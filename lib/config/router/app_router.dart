import 'package:app_english/presentation/screens/home_page_screen.dart';
import 'package:app_english/widgets/shared/loading_screen.dart';
import 'package:app_english/widgets/shared/welcome_sreen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path:'/', builder: (context, state) => const LoadingScreen()),
    
    GoRoute(path:'/welcomeScreen', builder: (context, state) => const WelcomeScreen()),


    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters["page"] ?? '0');

        return MyHomePage(pageIndex: pageIndex,);
      },
    ),
  ]
);