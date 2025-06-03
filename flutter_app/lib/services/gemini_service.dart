import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyB3eTY9wOgodtU8xbesrKRFwEdYwHtQRCg';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';
  
  static Future<String> generateResponse(String prompt, {String? context}) async {
    try {
      final fullPrompt = context != null 
          ? 'Context: $context\n\nUser: $prompt\n\nAs CoreMind AI, your personal learning companion, please provide a helpful and educational response:'
          : 'As CoreMind AI, your personal learning companion, please help with: $prompt';
      
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [{
            'parts': [{
              'text': fullPrompt
            }]
          }],
          'generationConfig': {
            'temperature': 0.7,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 1024,
          },
          'safetySettings': [
            {
              'category': 'HARM_CATEGORY_HARASSMENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_HATE_SPEECH',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_DANGEROUS_CONTENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            }
          ]
        }),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'];
        } else {
          return 'I apologize, but I couldn\'t generate a response at the moment. Please try again.';
        }
      } else {
        print('Gemini API Error: ${response.statusCode} - ${response.body}');
        return 'I\'m experiencing some technical difficulties. Please try again later.';
      }
    } catch (e) {
      print('Error calling Gemini API: $e');
      return 'I\'m having trouble connecting right now. Please check your internet connection and try again.';
    }
  }
  
  static Future<List<String>> generateLearningPlan(String subject, String level) async {
    final prompt = '''
    Create a structured learning plan for $subject at $level level. 
    Provide 5-7 key topics that should be covered, formatted as a simple list.
    Focus on practical, actionable learning objectives.
    ''';
    
    try {
      final response = await generateResponse(prompt);
      // Parse the response to extract topics
      final topics = response
          .split('\n')
          .where((line) => line.trim().isNotEmpty && (line.contains('•') || line.contains('-') || line.contains('.')))
          .map((line) => line.replaceAll(RegExp(r'^[•\-\d\.]\s*'), '').trim())
          .where((topic) => topic.isNotEmpty)
          .take(7)
          .toList();
      
      return topics.isNotEmpty ? topics : ['Introduction to $subject', 'Basic concepts', 'Practical applications'];
    } catch (e) {
      return ['Introduction to $subject', 'Basic concepts', 'Practical applications'];
    }
  }
}