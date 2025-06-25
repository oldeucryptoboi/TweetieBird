# 🐦 Bird Triage AI Mobile App – Project 1-Pager

## 🎯 Project Goal

Create a mobile app that allows everyday users to determine whether a bird needs to be rescued, using a photo and minimal input. The app provides friendly, reliable advice and connects users to local wildlife rehabbers if intervention is necessary.

---

## 👤 Target Users

- Concerned citizens who find birds outdoors (especially fledglings or injured individuals)
- Wildlife hotline operators and field volunteers
- Initially focused on **North Carolina**, with potential to scale

---

## ✅ Core User Stories

### 🖼️ Image Upload & AI Classification
> “I want to upload or take a photo to learn the bird's species, age, and health status.”

- Upload or take a photo
- App uses AI to classify:
  - Species (e.g., American Robin)
  - Age (e.g., Fledgling, Adult)
  - Health (e.g., Healthy, Injured, Dead)

---

### 📝 Add Observations
> “I want to describe what the bird is doing to help the AI give better advice.”

- Enter optional notes: “chirping but not flying”
- Auto-locate user via GPS or ZIP code

---

### 🧠 Receive Triage Guidance
> “I want the app to tell me clearly whether the bird needs rescue or not.”

- AI-powered assistant returns:
  - Natural-language recommendation
  - Explanation based on photo + user input

---

### 📍 Local Rehabber Referral
> “If the bird needs help, I want to know who to call nearby.”

- If rescue is needed, the app shows:
  - Nearest wildlife rehab center
  - Contact info and location
- Data stored in Firebase / Firestore for NC region

---

## ⚙️ Technical Overview

- **Frontend**: Flutter (iOS & Android)
- **Backend**: Firebase Auth, Firestore, Firebase Storage
- **AI Inference**:
  - TensorFlow model deployed to Vertex AI
  - Optionally enhanced with Gemini / PaLM for triage chat
- **Image Classifier**: CNN or transfer learning (MobileNetV2 or ResNet)

---

## 📊 Non-Functional Requirements

- Real-time feedback (< 3 sec)
- Secure storage and user privacy
- Option to share anonymized data for research (future)
- Future offline mode with background upload

---

## 📅 Phase 1: MVP Delivery

- [ ] Build Flutter UI for photo upload & note entry
- [ ] Train and deploy TF-based bird classifier
- [ ] Integrate AI endpoint with mobile app
- [ ] Set up rehabber referral logic for NC

---

