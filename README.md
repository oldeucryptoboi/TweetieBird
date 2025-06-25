# 🐦 Bird Triage AI Mobile App

A Flutter mobile application that helps users determine whether a bird needs to be rescued using AI-powered photo analysis. The app provides friendly, reliable advice and connects users to local wildlife rehabilitators if intervention is necessary.

## 🎯 Project Overview

Bird Triage AI is designed to help concerned citizens who find birds outdoors (especially fledglings or injured individuals) make informed decisions about whether wildlife intervention is needed. The app uses artificial intelligence to analyze photos and provide recommendations based on the bird's species, age, and health status.

## ✨ Key Features

### 📸 Image Upload & AI Classification
- Take photos directly in the app or upload from gallery
- AI-powered analysis to determine:
  - Bird species (e.g., American Robin, Northern Cardinal)
  - Age classification (Fledgling, Juvenile, Adult)
  - Health status (Healthy, Injured, Sick, Dead)

### 📝 Observation Notes
- Add optional observations about bird behavior
- GPS location tracking for better context
- Manual location input via ZIP code

### 🧠 Intelligent Triage Guidance
- Clear, natural-language recommendations
- Detailed explanations based on AI analysis
- Confidence scoring for transparency

### 📍 Local Rehabber Referral
- Automatic detection of nearby wildlife rehabilitation centers
- Contact information and operating hours
- Direct phone call and website access
- Species-specific facility matching

## 🛠️ Technical Stack

- **Frontend**: Flutter (iOS & Android)
- **State Management**: Provider
- **Image Handling**: image_picker, camera
- **Location Services**: geolocator, geocoding
- **HTTP Requests**: http, dio
- **UI Components**: Material Design 3
- **Future Backend**: Firebase (Auth, Firestore, Storage)
- **Future AI**: TensorFlow/Vertex AI integration

## 📱 Screenshots

The app features a clean, intuitive interface with:
- Photo capture and upload functionality
- Real-time AI analysis with loading indicators
- Detailed results with color-coded status indicators
- Nearby rehabber listings with contact actions
- Responsive design for various screen sizes

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.2.3 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/bird-triage-ai.git
   cd bird-triage-ai
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform Setup

#### Android
- Minimum SDK: API 21 (Android 5.0)
- Target SDK: API 33 (Android 13)
- Permissions: Camera, Location, Internet

#### iOS
- Minimum iOS version: 12.0
- Permissions: Camera, Location Services, Photo Library

## 📋 Usage Instructions

1. **Launch the App**: Open Bird Triage AI on your device
2. **Take/Upload Photo**: Use the camera or select from gallery
3. **Add Observations**: Optionally describe what the bird is doing
4. **Get Analysis**: Tap "Analyze Bird" to receive AI-powered advice
5. **Review Results**: Check the recommendation and explanation
6. **Contact Rehabbers**: If rescue is needed, contact nearby facilities

## 🎨 Design Philosophy

- **User-Friendly**: Simple, intuitive interface for all ages
- **Educational**: Clear explanations help users learn about wildlife
- **Accessible**: High contrast, readable text and touch-friendly buttons
- **Responsive**: Works on various screen sizes and orientations
- **Fast**: Optimized for quick analysis and response times

## 🔧 Development Status

### ✅ Completed (MVP)
- [x] Flutter project structure
- [x] Photo upload and capture functionality
- [x] Mock AI analysis service
- [x] Location services integration
- [x] Wildlife rehabber database (NC focus)
- [x] Analysis result display
- [x] Rehabber contact integration
- [x] Modern UI/UX design

### 🚧 In Progress
- [ ] Firebase integration
- [ ] Real AI model deployment
- [ ] User authentication
- [ ] Data persistence
- [ ] Offline mode

### 📋 Planned Features
- [ ] Multi-language support
- [ ] Bird identification guide
- [ ] Emergency contact integration
- [ ] Community reporting
- [ ] Research data sharing
- [ ] Push notifications

## 🗺️ Geographic Focus

Currently focused on **North Carolina** with plans to expand to:
- Southeastern United States
- National coverage
- International expansion

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Wildlife rehabilitation centers across North Carolina
- Flutter and Dart communities
- AI/ML research community
- Conservation organizations

## 📞 Support

For support, questions, or feature requests:
- Create an issue on GitHub
- Email: support@birdtriage.ai
- Website: https://birdtriage.ai

## 🔮 Future Vision

Bird Triage AI aims to become the go-to tool for wildlife rescue decisions, helping both concerned citizens and wildlife professionals make informed, timely decisions that benefit both animals and humans.

---

**Made with ❤️ for wildlife conservation** 