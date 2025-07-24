# Flutter Developer Portfolio

A modern, responsive web portfolio built with Flutter featuring a VSCode dark theme, MVVM architecture, and clean code principles.

## 🚀 Features

- **VSCode Dark Theme**: Authentic dark theme inspired by Visual Studio Code
- **MVVM Architecture**: Clean separation of concerns with Model-View-ViewModel pattern
- **Cubit State Management**: Reactive state management using flutter_bloc
- **GoRouter Navigation**: Declarative routing with type-safe navigation
- **Dependency Injection**: Clean architecture with get_it service locator
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Smooth Animations**: Beautiful transitions and micro-interactions
- **Modern UI/UX**: Clean, professional design with developer-focused aesthetics

## 🏗️ Architecture

The project follows MVVM (Model-View-ViewModel) architecture with clear separation of layers:

```
lib/
├── core/
│   ├── di/                 # Dependency injection
│   ├── models/             # Data models
│   ├── router/             # Navigation configuration
│   ├── services/           # Business logic services
│   └── theme/              # App theming
├── features/
│   ├── about/              # About page feature
│   ├── contact/            # Contact page feature
│   ├── home/               # Home page feature
│   ├── projects/           # Projects page feature
│   └── shared/             # Shared widgets
└── main.dart
```

### Key Components

- **Models**: Data structures (ProjectModel, SkillModel, ExperienceModel)
- **Views**: UI layer with responsive widgets
- **ViewModels (Cubits)**: State management and business logic
- **Services**: Core business logic and data management
- **Router**: Declarative navigation with GoRouter

## 🛠️ Technologies Used

- **Flutter 3.8.1+** - UI framework
- **Dart** - Programming language
- **flutter_bloc** - State management with Cubit
- **go_router** - Declarative routing
- **get_it** - Dependency injection
- **google_fonts** - Typography (JetBrains Mono, Source Code Pro)
- **responsive_framework** - Responsive design utilities
- **equatable** - Value equality for state objects

## 🎨 Design Philosophy

The portfolio embraces a developer-centric design approach:

- **VSCode Color Palette**: Familiar colors for developers
- **Code-Style Typography**: Monospace fonts for that authentic coding feel
- **Terminal Aesthetics**: Command-line inspired UI elements
- **Minimalist Layout**: Clean, distraction-free design
- **Dark Theme**: Easy on the eyes for extended viewing

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or later
- Dart SDK 3.8.1 or later
- Web development enabled in Flutter

### Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd my_portfolio/portfolio
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run -d web-server --web-port 3000
   ```

4. Open your browser and navigate to `http://localhost:3000`

## 📦 Building for Production

### Quick Build Commands

**Using Makefile (Recommended):**

```bash
# Build and deploy to web directory
make deploy-web

# Build only
make build-web

# Run development server
make dev

# Clean build files
make clean
```

**Using Shell Scripts:**

```bash
# On Linux/Mac
./build_web.sh

# On Windows
build_web.bat
```

**Manual Build:**

```bash
flutter build web --release --web-renderer html
cp -r build/web/* ../web/
```

### Deployment

After building, the web files will be in the `/web` directory and ready for deployment to any static hosting service:

- **Firebase Hosting**: `firebase deploy`
- **Netlify**: Drag and drop the `/web` folder
- **Vercel**: Connect your repository
- **GitHub Pages**: Push the `/web` folder to `gh-pages` branch

## 📱 Pages Overview

### Home Page

- Hero section with animated code snippet
- Developer introduction with VSCode-style editor
- Call-to-action buttons
- Mobile development focus

### About Page

- Skills showcase with proficiency indicators
- Technology categories and filtering
- Work experience timeline
- Interactive skill cards

### Projects Page

- Project grid with search and filtering
- Technology tags
- GitHub and live demo links
- Featured project highlighting

### Contact Page

- Contact form with validation
- Contact information display
- Social media links
- Form submission handling

## 🎯 State Management

The app uses **Cubit** from the flutter_bloc package for state management:

- **HomeCubit**: Manages home page state (animations, mobile menu)
- **AboutCubit**: Handles skills and experience data
- **ProjectsCubit**: Manages project filtering and search
- **ContactCubit**: Controls contact form state and validation

## 🔧 Customization

### Updating Portfolio Data

Edit the `PortfolioService` class in `lib/core/services/portfolio_service.dart`:

- **Skills**: Modify the `getSkills()` method
- **Projects**: Update the `getProjects()` method
- **Experience**: Change the `getExperience()` method
- **Contact Info**: Edit the `getContactInfo()` method

### Theming

The VSCode dark theme can be customized in `lib/core/theme/app_theme.dart`:

- Colors: Update the color constants
- Typography: Modify Google Fonts selections
- Component themes: Adjust button, card, and input styles

### Adding New Features

1. Create a new feature folder in `lib/features/`
2. Add view, view_model, and widgets subdirectories
3. Register new cubits in the service locator
4. Add routes to the app router

## 🧪 Testing

Run tests with:

```bash
flutter test
```

Run code analysis:

```bash
dart analyze
# or
make analyze
```

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 📞 Contact

**Mohamed Maher** - Mobile Developer

- **Email**: mohamedmaher.developer@gmail.com
- **Phone**: +201065027589
- **Location**: Egypt
- **LinkedIn**: [Your LinkedIn Profile](https://linkedin.com/in/yourprofile)
- **GitHub**: [Your GitHub Profile](https://github.com/yourusername)

---

**Built with ❤️ using Flutter and modern development practices**
