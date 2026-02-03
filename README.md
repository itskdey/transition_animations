# Flutter Advanced Transition Animations For Navigator

A professional, high-performance collection of custom page transitions for Flutter applications. This project provides a robust and easy-to-use utility for implementing modern, fluid animations that enhance the user experience.

## ✨ Features

This project includes a wide range of transition effects, allowing you to choose the perfect animation for your app's flow:

- **Fade Transitions**: Standard and "Fade Through" for smooth appearance.
- **Shared Axis**: X and Y axis shared transitions (inspired by Material Design).
- **iOS Style**: Native-feeling `iosPush` and `iosPushParallax` transitions.
- **Scale & Slide**: Dynamic `scaleFade` and `slideUpFade` effects.
- **Overlays**: Professional `bottomSheet` and `dialogBlur` transitions.
- **Advanced Reveal**: Interactive `circleReveal` clipper for unique transitions.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version recommended)
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/itskdey/transition_animations.git
   ```
2. Navigate to the project directory:
   ```bash
   cd transition_animation
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```

## 🛠 Usage

Integrating these animations into your Flutter app is straightforward using the `PageTransition.build` method within your `onGenerateRoute`.

### Basic Example

```dart
onGenerateRoute: (settings) {
  switch (settings.name) {
    case '/screen2':
      return PageTransition.build(
        page: const Screen2(),
        settings: settings,
        transition: PageTransitionType.iosPushParallax,
        duration: const Duration(milliseconds: 500),
      );
    default:
      return MaterialPageRoute(builder: (_) => const Screen1());
  }
}
```

### Supported Transition Types

| Type | Description |
| :--- | :--- |
| `fade` | Simple opacity fade. |
| `fadeThrough` | Material-style fade through. |
| `sharedAxisX` | Shared axis transition on the X-axis. |
| `sharedAxisY` | Shared axis transition on the Y-axis. |
| `iosPush` | Standard iOS-style push animation. |
| `iosPushParallax` | iOS-style push with parallax effect. |
| `scaleFade` | Combines scaling and fading. |
| `slideUpFade` | Slides up while fading in. |
| `bottomSheet` | Custom bottom sheet animation with dimming. |
| `dialogBlur` | Scale-up animation with background blur. |
| `circleReveal` | Unique circular reveal animation. |

## 📂 Project Structure

- `lib/routes/page_transition.dart`: The core engine containing all transition logic.
- `lib/routes/page_routes.dart`: Example of how to integrate transitions into routing.
- `lib/screens/`: Sample screens demonstrating the animations.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*Created with ❤️ by Mean Pheakdey.*
