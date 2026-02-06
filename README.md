# Flutter Transition Animations

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fitskdey%2Ftransition_animations&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views&edge_flat=false)](https://hits.seeyoufarm.com)
[![GitHub stars](https://img.shields.io/github/stars/itskdey/transition_animations?style=social)](https://github.com/itskdey/transition_animations/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/itskdey/transition_animations?style=social)](https://github.com/itskdey/transition_animations/network/members)

Welcome to the **Transition Animations** usage guide. This documentation is designed to take you on a step-by-step journey through integrating high-quality, custom page transitions into your Flutter application. Whether you need a subtle fade or a complex iOS-style parallax push, this project provides the robust tools to make it happen.

---

## 📚 Table of Contents

1. [Introduction](#-introduction)
2. [Features](#-features)
3. [The Architecture](#-the-architecture)
4. [Step-by-Step Implementation Guide](#-step-by-step-implementation-guide)
   - [Step 1: Define Your Routes](#step-1-define-your-routes)
   - [Step 2: The Route Generator](#step-2-the-route-generator)
   - [Step 3: Connect to Main](#step-3-connect-to-main)
   - [Step 4: Navigating](#step-4-navigating)
5. [Transition Gallery](#-transition-gallery)
6. [Customization](#-customization)

---

## 🌟 Introduction

Standard navigation in Flutter is functional, but often lacks the "wow" factor that premium apps possess. This project solves that by encapsulating complex animation logic into a single, easy-to-use utility: `PageTransition`.

By the end of this guide, you will understand not just *how* to use it, but *why* it works the way it does.

## ✨ Features

- **Draggable & Dismissible**: Support for gestures where applicable.
- **Platform Native Feel**: iOS and Android specific physics available.
- **High Performance**: Built directly on Flutter's `PageRouteBuilder` for 60fps animations.
- **Zero Boilerplate**: No need to write custom `AnimationController`s for every screen.

---

## 🏗 The Architecture

At the heart of this project lies the **`PageTransition`** class (`lib/routes/page_transition.dart`).

Think of this class as your "Director". It doesn't draw the UI itself; instead, it directs how the next scene (Screen) enters the stage. It handles:
- **Duration**: How long the scene change takes.
- **Curves**: The acceleration and deceleration of the movement.
- **Type**: The specific choreography (Fade, Slide, Scale, etc.).

---

## 🚀 Step-by-Step Implementation Guide

Follow these four steps to completely overhaul your app's navigation.

### Step 1: Define Your Routes

First, we need a central registry for our screen names. This avoids typos and "magic strings" scattered throughout your codebase.

**Create/Open:** `lib/routes/app_routes.dart`

```dart
abstract class AppRoutes {
  AppRoutes._(); // Private constructor to prevent instantiation

  // Define static constants for your screen paths
  static const String screen1 = "/screen1";
  static const String screen2 = "/screen2";
  static const String profile = "/profile";
  static const String settings = "/settings";
}
```

### Step 2: The Route Generator

This is where the magic happens. Instead of defining routes inline, we use a `onGenerateRoute` function. This allows us to dynamically intercept navigation requests and wrap them in our custom `PageTransition`.

**Create/Open:** `lib/routes/page_routes.dart`

```dart
import 'package:flutter/material.dart';
import 'package:transition_animation/routes/app_routes.dart';
import 'package:transition_animation/routes/page_transition.dart';
import 'package:transition_animation/screens/screen1.dart'; // Import your screens

class PageRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      // Case 1: The standard Fade Through transition
      case AppRoutes.screen1:
        return PageTransition.build(
          page: Screen1(),
          settings: settings,
          transition: PageTransitionType.fadeThrough, // <--- The visual style
          duration: const Duration(milliseconds: 300),
        );

      // Case 2: A cinematic iOS Parallax Push
      case AppRoutes.screen2:
        return PageTransition.build(
          page: Screen2(),
          settings: settings,
          transition: PageTransitionType.iosPushParallax, // <--- The visual style
        );

      // Default: Fallback for unknown routes
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
```

### Step 3: Connect to Main

Now, tell your `MaterialApp` to use this generator.

**Open:** `lib/main.dart`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      // ... your theme config ...
      
      // 1. Set the initial route
      initialRoute: AppRoutes.screen1,
      
      // 2. Hook up your route generator
      onGenerateRoute: PageRoutes.onGenerateRoute, 
    );
  }
}
```

### Step 4: Navigating

To trigger these animations, you don't need to do anything special! Just use the standard Flutter Navigator. The `onGenerateRoute` we set up in Step 2 will handle the rest independently.

```dart
// In your button or gesture detector:
ElevatedButton(
  onPressed: () {
    // This simple call triggers the advanced animation defined in PageRoutes
    Navigator.pushNamed(context, AppRoutes.screen2);
  },
  child: const Text("Go to Scene 2"),
),
```

---

## 🎨 Transition Gallery

Here are the available transition types you can pass to `PageTransitionType`:

| Type | Visual Effect | Best Used For |
| :--- | :--- | :--- |
| **`fade`** | Simple opacity change. | Dialogs, Splash screens. |
| **`fadeThrough`** | New page fades in while scaling up slightly. | Top-level tabs, major context switches. |
| **`sharedAxisX`** | Horizontal slide + fade. | stepping through a wizard/form. |
| **`sharedAxisY`** | Vertical slide + fade. | Drilling down into details. |
| **`iosPush`** | Classic iOS slide from right. | Standard navigation flows. |
| **`iosPushParallax`** | iOS slide with background parallax. | Premium, deep-navigation feels. |
| **`scaleFade`** | Scales up from 90% to 100%. | Pop-ups, focus views. |
| **`slideUpFade`** | Slides up from bottom + fade. | Detailed views, articles. |
| **`bottomSheet`** | Slides fully from bottom + dim background. | Settings, filters, options. |
| **`dialogBlur`** | Pop-in + background blur. | Alerts, Confirmations. |
| **`circleReveal`** | Expands from a specific center point. | FAB expansions, map markers. |

---

## 🎛 Customization

The `PageTransition.build` method is highly configurable:

```dart
PageTransition.build(
  page: Screen2(),
  settings: settings,
  
  // 1. The Animation Style
  transition: PageTransitionType.circleReveal,
  
  // 2. Timing
  duration: const Duration(milliseconds: 600), // Slower for dramatic effect
  reverseDuration: const Duration(milliseconds: 400), // Faster exit
  
  // 3. For Circle Reveal specifically: where does it start?
  circleRevealCenter: const Offset(0.9, 0.9), // Bottom-right corner
);
```