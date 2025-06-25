import 'dart:io';
import '../models/bird_analysis.dart';

class AIService {

  // Mock AI analysis for development
  static Future<BirdAnalysis> analyzeBirdImage(
    File imageFile, {
    String? userNotes,
    Location? location,
  }) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 2));

      // Mock analysis results
      final mockResults = _getMockAnalysisResults();

      return BirdAnalysis(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        species: mockResults['species'],
        age: mockResults['age'],
        healthStatus: mockResults['healthStatus'],
        recommendation: mockResults['recommendation'],
        explanation: mockResults['explanation'],
        confidence: mockResults['confidence'],
        timestamp: DateTime.now(),
        userNotes: userNotes,
        location: location,
      );
    } catch (e) {
      throw Exception('Failed to analyze bird image: $e');
    }
  }

  // Real API implementation (commented out for development)
  /*
  static Future<BirdAnalysis> analyzeBirdImageReal(
    File imageFile, {
    String? userNotes,
    Location? location,
  }) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      // Prepare request body
      final requestBody = {
        'image': base64Image,
        'notes': userNotes,
        'location': location?.toJson(),
      };
      
      // Make API request
      final response = await http.post(
        Uri.parse('$_baseUrl/analyze'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_API_KEY',
        },
        body: jsonEncode(requestBody),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BirdAnalysis.fromJson(data);
      } else {
        throw Exception('API request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to analyze bird image: $e');
    }
  }
  */

  static Map<String, dynamic> _getMockAnalysisResults() {
    final mockResults = [
      {
        'species': 'American Robin',
        'age': 'Fledgling',
        'healthStatus': 'Healthy',
        'recommendation':
            'Leave the bird alone. This is a healthy fledgling learning to fly.',
        'explanation':
            'Fledglings often spend time on the ground while learning to fly. This is normal behavior and the parents are likely nearby.',
        'confidence': 0.92,
      },
      {
        'species': 'Northern Cardinal',
        'age': 'Adult',
        'healthStatus': 'Injured',
        'recommendation':
            'This bird needs immediate rescue. Contact a wildlife rehabilitator.',
        'explanation':
            'The bird shows signs of injury including drooping wing and inability to fly properly.',
        'confidence': 0.87,
      },
      {
        'species': 'Blue Jay',
        'age': 'Juvenile',
        'healthStatus': 'Sick',
        'recommendation':
            'This bird appears sick and should be rescued for treatment.',
        'explanation':
            'The bird shows lethargy and abnormal behavior consistent with illness.',
        'confidence': 0.78,
      },
      {
        'species': 'House Sparrow',
        'age': 'Adult',
        'healthStatus': 'Healthy',
        'recommendation':
            'No intervention needed. This is a healthy adult bird.',
        'explanation':
            'The bird appears healthy and is exhibiting normal behavior.',
        'confidence': 0.95,
      },
    ];

    // Return a random mock result
    return mockResults[DateTime.now().millisecond % mockResults.length];
  }
}
