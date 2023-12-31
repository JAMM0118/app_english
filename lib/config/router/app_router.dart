import 'package:app_english/presentation/models/stands_model.dart';
import 'package:app_english/presentation/screens/home_page_screen.dart';
import 'package:app_english/presentation/screens/stands_screen.dart';
import 'package:app_english/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path:'/', builder: (context, state) => const LoadingScreen()),
    
    GoRoute(path:'/welcomeScreen', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path:'/bienvenidaScreen', builder: (context, state) => const BienvenidaScreen()),
    

    GoRoute(
      
      path:'/standsScreen',
    
     builder: (context, state) {
     final data =  state.extra as Map<String, dynamic>;
      return  StandsScreen(standType: StandModel.fromJson(data));
     }
     
     
     ),


    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters["page"] ?? '0');

        return MyHomePage(pageIndex: pageIndex,);
      },
    ),
  ]
);