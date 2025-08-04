import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liftcore/src/core/router/route_paths.dart';
import 'package:liftcore/src/features/analytics/insight_screen.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/screens/login_screen.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/screens/sign_up_screen.dart';
import 'package:liftcore/src/features/authentication/registration_steps/presentation/complete_registration_steps_screen.dart';
import 'package:liftcore/src/features/authentication/registration_steps/presentation/review_your_info_screen.dart';
import 'package:liftcore/src/features/authentication/registration_steps/presentation/success_completion_step_screen.dart';
import 'package:liftcore/src/features/home/main_home_screen.dart';
import 'package:liftcore/src/features/home/presentation/home_page/home_page.dart';
import 'package:liftcore/src/features/home/presentation/home_page/presentation/daily_task/daily_task_screen.dart';
import 'package:liftcore/src/features/exercise_library/exercise_detail_screen.dart';
import 'package:liftcore/src/features/home/presentation/home_page/presentation/daily_task/exercise_category_screen.dart';
import 'package:liftcore/src/features/profile/edit_profile_screen.dart';
import 'package:liftcore/src/features/profile/profile_screen.dart';
import 'package:liftcore/src/features/exercise_browser/search_exercise_screen.dart';
import 'package:liftcore/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:liftcore/src/features/subscription/subscription_screen.dart';
import 'package:liftcore/src/shared/screens/error_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

String _extractPath(String path) => path.split('/').last;

final router = GoRouter(
  initialLocation: RoutePaths.home,
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    /* -------------------------------------------------------------------- */
    /*                  ONBOARDING AND REGISTRATION ROUTES                  */
    /* -------------------------------------------------------------------- */

    GoRoute(
      path: RoutePaths.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: RoutePaths.completeRegistrationSteps,
      builder: (context, state) => CompleteRegistrationSteps(),
    ),
    GoRoute(
      path: RoutePaths.reviewYourInfoScreen,
      builder: (context, state) => ReviewYourInfoScreen(),
    ),
    GoRoute(
      path: RoutePaths.loginScreen,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.signUpScreen,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: RoutePaths.successCompletionStepScreen,
      builder: (context, state) => SuccessCompletionStepScreen(),
    ),

    /* -------------------------------------------------------------------- */
    /*                           STANDLONE ROUTES                           */
    /* -------------------------------------------------------------------- */

    GoRoute(
        path: _extractPath(RoutePaths.exerciseDetailScreen),
        builder: (context, state) => const ExerciseDetailScreen(),
        routes: [
          GoRoute(
            path: _extractPath(RoutePaths.exerciseScreen),
            builder: (context, state) => InsightScreen(),
          )
        ]),

    /* -------------------------------------------------------------------- */
    /*                       BOTTOM NAVIGATION ROUTES                       */
    /* -------------------------------------------------------------------- */

    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) => MainHomeScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: _extractPath(RoutePaths.dailyTaskScreen),
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => DailyTaskScreen(),
                ),
                GoRoute(
                  path: _extractPath(RoutePaths.exerciseCategoryScreen),
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ExerciseCategoryScreen(),
                )
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePaths.searchExerciseScreen,
            builder: (context, state) => SearchExerciseScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePaths.insightScreen,
            builder: (context, state) => InsightScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePaths.userProfileScreen,
              builder: (context, state) => ProfileScreen(),
              routes: [
                GoRoute(
                  path: _extractPath(RoutePaths.editProfileScreen),
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => EditProfileScreen(),
                ),
                GoRoute(
                  path: _extractPath(RoutePaths.subscriptionScreen),
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => SubscriptionScreen(),
                )
              ]),
        ])
      ],
    )
  ],
);
