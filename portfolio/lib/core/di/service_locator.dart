import 'package:get_it/get_it.dart';
import '../../features/home/view_models/home_cubit.dart';
import '../../features/about/view_models/about_cubit.dart';
import '../../features/projects/view_models/projects_cubit.dart';
import '../../features/contact/view_models/contact_cubit.dart';
import '../services/navigation_service.dart';
import '../services/portfolio_service.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Services
  sl.registerLazySingleton<NavigationService>(() => NavigationService());
  sl.registerLazySingleton<PortfolioService>(() => PortfolioService());

  // Cubits
  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<AboutCubit>(() => AboutCubit(sl()));
  sl.registerFactory<ProjectsCubit>(() => ProjectsCubit(sl()));
  sl.registerFactory<ContactCubit>(() => ContactCubit());
}
