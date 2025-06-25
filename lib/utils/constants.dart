import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'Bird Triage AI';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'AI-powered bird rescue triage app';

  // Colors
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color secondaryColor = Color(0xFF2196F3);
  static const Color accentColor = Color(0xFF9C27B0);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // API Configuration
  static const String aiApiBaseUrl = 'https://api.birdtriage.ai';
  static const int apiTimeoutSeconds = 30;
  static const int maxImageSize = 1024; // pixels
  static const double imageQuality = 0.85;

  // Location Configuration
  static const double defaultSearchRadius = 50.0; // miles
  static const double maxSearchRadius = 100.0; // miles

  // Mock Data Configuration
  static const bool useMockData = true; // Set to false when real API is ready

  // Error Messages
  static const String errorImagePick = 'Error picking image. Please try again.';
  static const String errorImageAnalysis =
      'Error analyzing image. Please try again.';
  static const String errorLocationPermission =
      'Location permission denied. Please enable location services.';
  static const String errorNoRehabbers =
      'No nearby rehabbers found. Please search online for wildlife rehabilitators.';
  static const String errorNetwork =
      'Network error. Please check your connection and try again.';

  // Success Messages
  static const String successImageUploaded = 'Image uploaded successfully!';
  static const String successAnalysisComplete = 'Analysis complete!';
  static const String successRehabberContacted =
      'Rehabber contacted successfully!';

  // Placeholder Text
  static const String placeholderNotes =
      'Describe what the bird is doing (e.g., "chirping but not flying", "lying on ground")';
  static const String placeholderZipCode = 'Enter ZIP code for location';

  // Button Text
  static const String buttonTakePhoto = 'Take Photo';
  static const String buttonGallery = 'Gallery';
  static const String buttonRetake = 'Retake';
  static const String buttonChange = 'Change';
  static const String buttonAnalyze = 'Analyze Bird';
  static const String buttonAnalyzing = 'Analyzing...';
  static const String buttonCall = 'Call';
  static const String buttonWebsite = 'Website';
  static const String buttonStartOver = 'Start Over';

  // App Bar Titles
  static const String titleHome = '🐦 Bird Triage AI';
  static const String titleAnalysis = 'Analysis Results';
  static const String titleRehabbers = 'Nearby Rehabbers';

  // Section Headers
  static const String headerSelectPhoto = 'Select a Photo';
  static const String headerObservations = 'Additional Observations (Optional)';
  static const String headerNearbyRehabbers = 'Nearby Wildlife Rehabilitators';
  static const String headerRecommendation = 'Recommendation';
  static const String headerExplanation = 'Explanation';

  // Status Messages
  static const String statusRescueNeeded = 'Rescue Needed';
  static const String statusNoRescueRequired = 'No Rescue Required';
  static const String statusAnalyzing = 'Analyzing Bird Image...';
  static const String statusLoadingRehabbers = 'Loading nearby rehabbers...';

  // Confidence Levels
  static const double confidenceHigh = 0.8;
  static const double confidenceMedium = 0.6;
  static const double confidenceLow = 0.4;
}
