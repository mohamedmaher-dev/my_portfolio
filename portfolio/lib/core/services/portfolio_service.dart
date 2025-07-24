import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';

class PortfolioService {
  // Skills data - Mobile Development focused
  List<SkillModel> getSkills() {
    return [
      SkillModel(
        name: 'Flutter',
        category: 'Mobile Development',
        proficiency: 95,
        icon: 'flutter',
        color: '#02569B',
      ),
      SkillModel(
        name: 'Dart',
        category: 'Programming Language',
        proficiency: 95,
        icon: 'dart',
        color: '#0175C2',
      ),
      SkillModel(
        name: 'Kotlin',
        category: 'Programming Language',
        proficiency: 90,
        icon: 'kotlin',
        color: '#7F52FF',
      ),
      SkillModel(
        name: 'Android Studio',
        category: 'IDE',
        proficiency: 90,
        icon: 'android',
        color: '#3DDC84',
      ),
      SkillModel(
        name: 'Firebase',
        category: 'Backend',
        proficiency: 85,
        icon: 'firebase',
        color: '#FFCA28',
      ),
      SkillModel(
        name: 'REST APIs',
        category: 'Backend',
        proficiency: 85,
        icon: 'api',
        color: '#FF6B35',
      ),
      SkillModel(
        name: 'SQLite',
        category: 'Database',
        proficiency: 80,
        icon: 'database',
        color: '#003B57',
      ),
      SkillModel(
        name: 'Git',
        category: 'Tools',
        proficiency: 85,
        icon: 'git',
        color: '#F05032',
      ),
      SkillModel(
        name: 'Provider',
        category: 'State Management',
        proficiency: 90,
        icon: 'provider',
        color: '#02569B',
      ),
      SkillModel(
        name: 'BLoC/Cubit',
        category: 'State Management',
        proficiency: 88,
        icon: 'bloc',
        color: '#02569B',
      ),
      SkillModel(
        name: 'Material Design',
        category: 'UI/UX',
        proficiency: 85,
        icon: 'material',
        color: '#757575',
      ),
      SkillModel(
        name: 'Native Android',
        category: 'Mobile Development',
        proficiency: 75,
        icon: 'android',
        color: '#3DDC84',
      ),
    ];
  }

  // Projects data - Mobile focused
  List<ProjectModel> getProjects() {
    return [
      ProjectModel(
        id: '1',
        title: 'E-commerce Mobile App',
        description:
            'A feature-rich e-commerce mobile application built with Flutter. Includes user authentication, product catalog, shopping cart, payment integration, and order tracking.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe API', 'Provider'],
        imageUrl: 'assets/images/ecommerce_app.png',
        githubUrl: 'https://github.com/username/flutter-ecommerce',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.ecommerce',
        category: 'E-commerce',
        featured: true,
      ),
      ProjectModel(
        id: '2',
        title: 'Task Manager App',
        description:
            'A productivity app for task management with offline support, local notifications, and cloud sync. Built with Flutter and BLoC pattern.',
        technologies: [
          'Flutter',
          'BLoC',
          'SQLite',
          'Firebase',
          'Local Notifications',
        ],
        imageUrl: 'assets/images/task_manager.png',
        githubUrl: 'https://github.com/username/flutter-task-manager',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.taskmanager',
        category: 'Productivity',
        featured: true,
      ),
      ProjectModel(
        id: '3',
        title: 'Weather Forecast App',
        description:
            'Beautiful weather app with animated UI, location-based forecasts, and weather alerts. Features custom animations and smooth transitions.',
        technologies: [
          'Flutter',
          'OpenWeather API',
          'Geolocator',
          'Animations',
        ],
        imageUrl: 'assets/images/weather_app.png',
        githubUrl: 'https://github.com/username/flutter-weather',
        liveUrl: null,
        category: 'Utility',
        featured: false,
      ),
      ProjectModel(
        id: '4',
        title: 'Chat Application',
        description:
            'Real-time messaging app with end-to-end encryption, media sharing, and group chat functionality. Built with Firebase and custom UI.',
        technologies: [
          'Flutter',
          'Firebase',
          'Cloud Firestore',
          'Firebase Auth',
        ],
        imageUrl: 'assets/images/chat_app.png',
        githubUrl: 'https://github.com/username/flutter-chat',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.chat',
        category: 'Social',
        featured: true,
      ),
      ProjectModel(
        id: '5',
        title: 'Fitness Tracker (Native Android)',
        description:
            'Native Android fitness tracking app built with Kotlin. Features step counting, workout tracking, and health data visualization.',
        technologies: [
          'Kotlin',
          'Android',
          'Room Database',
          'Health Connect API',
        ],
        imageUrl: 'assets/images/fitness_app.png',
        githubUrl: 'https://github.com/username/kotlin-fitness-tracker',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.fitness',
        category: 'Health',
        featured: false,
      ),
      ProjectModel(
        id: '6',
        title: 'Recipe Finder App',
        description:
            'Discover and save your favorite recipes with this Flutter app. Features ingredient-based search, meal planning, and offline recipe storage.',
        technologies: ['Flutter', 'REST API', 'SQLite', 'Provider', 'Camera'],
        imageUrl: 'assets/images/recipe_app.png',
        githubUrl: 'https://github.com/username/flutter-recipes',
        liveUrl: null,
        category: 'Lifestyle',
        featured: false,
      ),
    ];
  }

  // Experience data - Mobile development focused
  List<ExperienceModel> getExperience() {
    return [
      ExperienceModel(
        id: '1',
        title: 'Senior Mobile Developer',
        company: 'TechMobile Solutions',
        duration: '2022 - Present',
        description:
            'Leading mobile app development team, specializing in Flutter and Kotlin. Architecting scalable mobile applications, implementing CI/CD pipelines, and mentoring junior developers in mobile development best practices.',
        technologies: [
          'Flutter',
          'Kotlin',
          'Firebase',
          'CI/CD',
          'Google Play Console',
        ],
      ),
      ExperienceModel(
        id: '2',
        title: 'Flutter Developer',
        company: 'AppCraft Studio',
        duration: '2020 - 2022',
        description:
            'Developed cross-platform mobile applications using Flutter. Implemented complex UI/UX designs, integrated third-party APIs, and optimized app performance for both Android and iOS platforms.',
        technologies: [
          'Flutter',
          'Dart',
          'REST APIs',
          'SQLite',
          'Provider',
          'BLoC',
        ],
      ),
      ExperienceModel(
        id: '3',
        title: 'Android Developer',
        company: 'Mobile Innovations Inc.',
        duration: '2019 - 2020',
        description:
            'Built native Android applications using Kotlin and Java. Worked with Material Design guidelines, implemented local databases, and integrated various Android SDKs and APIs.',
        technologies: [
          'Kotlin',
          'Java',
          'Android SDK',
          'Room Database',
          'Retrofit',
        ],
      ),
      ExperienceModel(
        id: '4',
        title: 'Mobile App Developer (Intern)',
        company: 'StartupTech',
        duration: '2018 - 2019',
        description:
            'Started mobile development journey with Flutter and native Android. Contributed to multiple mobile projects, learned mobile development fundamentals, and gained experience with app store deployment.',
        technologies: ['Flutter', 'Dart', 'Kotlin', 'Firebase', 'Git'],
      ),
    ];
  }

  // Contact information
  Map<String, String> getContactInfo() {
    return {
      'email': 'mohamedmaher.developer@gmail.com',
      'phone': '+201065027589',
      'location': 'Egypt',
      'linkedin': 'https://linkedin.com/in/yourprofile',
      'github': 'https://github.com/yourusername',
      'playstore':
          'https://play.google.com/store/apps/developer?id=YourDeveloperName',
    };
  }
}
