import 'package:app_english/presentation/screens/home_page_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [

    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters["page"] ?? '0');

        return MyHomePage(pageIndex: pageIndex,);
      },
    ),
  ]
);