import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class AppTextTheme {
  AppTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: AppColors.dark),
    headlineMedium: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: AppColors.dark),
    headlineSmall: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.dark),

    titleLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleMedium: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.dark),
    titleSmall: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.dark),

    bodyLarge: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodyMedium: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: AppColors.dark),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.dark.withAlpha(128)),

    labelLarge: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.dark),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.dark.withAlpha(128)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: AppColors.light),
    headlineMedium: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: AppColors.light),
    headlineSmall: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.light),

    titleLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.light),
    titleMedium: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.light),
    titleSmall: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.light),

    bodyLarge: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.light),
    bodyMedium: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: AppColors.light),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.light.withAlpha(128)),

    labelLarge: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.light),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.light.withAlpha(128)),
  );
}


// Usage Recommendations:
// headlineLarge, headlineMedium, headlineSmall:

// Usage: These are used for large and prominent headings.

// Example: Titles, section headers, large titles.

// When to Use: Use for content headers or large titles that need emphasis, like a page heading or a section name.

// titleLarge, titleMedium, titleSmall:

// Usage: These are used for medium emphasis text like titles and subtitles.

// Example: Sub-headings, section titles.

// When to Use: For headings or subtitles that aren’t as large as headlineLarge but still need emphasis.

// bodyLarge, bodyMedium, bodySmall:

// Usage: Used for general text content.

// Example: Paragraph text, content body.

// When to Use: These are the most commonly used text styles. Use them for the general body of your content, such as descriptions, paragraphs, or general information.

// labelLarge, labelMedium:

// Usage: These are used for form labels, captions, or small hints.

// Example: Form field labels, button labels, small text information.

// When to Use: These are typically used for smaller pieces of information, like labels for text fields or smaller captions.