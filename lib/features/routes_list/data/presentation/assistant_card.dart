import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';


class AssistantPopup extends StatefulWidget {
  const AssistantPopup({Key? key}) : super(key: key);

  @override
  State<AssistantPopup> createState() => _AssistantPopupState();
}

class _AssistantPopupState extends State<AssistantPopup> {
  final TextEditingController _controller = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isListening = false;
  String _assistantReply = "";
  bool _isLoading = false;

  final String apiKey = "YOUR_API_KEY";

  final Map<String, Map<String, String>> jeepneyRoutes = {
    'checkpoint-holy-loop': {
      'desc':
      'This route connects Checkpoint to Holy Angel University. It passes Nepo Quad and Angeles City Hall.',
      'drops': 'Holy Angel University, Nepo Mart, Checkpoint'
    },
    'marisol-pampang': {
      'desc':
      'Runs between Marisol and Pampang, serving residential and public market areas.',
      'drops': 'Marisol, Pampang Terminal, Angeles City Proper, Mugs and Magic, Marisol Gate 2'
    },
    'Villa-Pampang': {
      'desc':
      'Connects Villa Angela subdivision to Pampang. Popular among commuters heading to local schools.',
      'drops': 'Holy Angel University, Pampang Market, Pandan Road, SM Telebastagan, Nepo Mall'
    },
    'capaya': {
      'desc':
      'Capaya route services Capaya and nearby barangays, connecting them to downtown Angeles.',
      'drops': 'Capaya, Holy Family Academy, Angeles City Hall, City Center Subdivision, Hi-Precision Diagnostic'
    },
    'sapangbato': {
      'desc':
      'Sapangbato route travels from downtown to the Sapangbato area near Clark Freeport.',
      'drops': 'Sapangbato, Friendship, Checkpoint, Coffee Bay, Porac Intersection'
    },
    'carmenville': {
      'desc':
      'Carmenville route covers major residential zones with access to Clark area and Nepo Center.',
      'drops': 'Carmenville, Nepo Center, Marquee Mall, Circuit people Gym, Coffee Cat'
    },
    'pandan': {
      'desc':
      'Pandan jeepneys travel from the northern side of Angeles City to the market area.',
      'drops': 'Pandan, Nepo Mart, Angeles City Hall, Hi-Precicion Medical Center'
    },
    'checkpoint-balibago': {
      'desc':
      'Main line between Checkpoint and Balibago, covering nightlife and commercial zones.',
      'drops': 'Balibago, Walking Street, Checkpoint, Friendship Highway'
    },
    'hensonville': {
      'desc':
      'Hensonville route serves residential neighborhoods leading to major shopping centers.',
      'drops': 'Hensonville, SM Clark, Angeles City Proper'
    },
    'mining': {
      'desc':
      'Covers the Mining district and nearby barangays, connecting to Checkpoint and downtown.',
      'drops': 'Mining, Checkpoint, Holy Rosary Parish, Holy Angel University, Nepo Mart'
    },
  };


  @override
  void initState() {
    super.initState();
    _flutterTts.setSpeechRate(0.55);
  }

  Future<void> _sendMessage() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _assistantReply = "";
    });

    final model = GenerativeModel(model: "gemini-2.5-flash", apiKey: apiKey);
    final routeData = jeepneyRoutes.entries
        .map((e) => "${e.key}: ${e.value['desc']} (Drops: ${e.value['drops']})")
        .join("\n");

    final prompt = """
You are Sakay_PH's cat assistant 🐱 helping people with jeepney routes in Angeles City.
Here are the known routes:
$routeData

User: $query
Give short, friendly, helpful answers, remove any format like asterisk in conversation, plain text only — like a cute cat explaining routes.
""";


    try {
      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text ?? "Meow~ I couldn’t find that info 🐾";

      setState(() {
        _assistantReply = text;
        _isLoading = false;
      });

      await _flutterTts.speak(text);
    } catch (e) {
      setState(() {
        _assistantReply = "Something went wrong. Try again 🐾";
        _isLoading = false;
      });
    }
  }

  Timer? _silenceTimer;

  Future<void> _startListening() async {
    bool available = await _speech.initialize(
      onError: (error) => debugPrint("Speech error: $error"),
      onStatus: (status) {
        debugPrint("Speech status: $status");
        if (status == "notListening") _stopListening();
      },
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        listenMode: stt.ListenMode.confirmation,
        localeId: "en_PH",
        onResult: (result) {
          setState(() => _controller.text = result.recognizedWords);

          // Restart silence timer every time new words are recognized
          _silenceTimer?.cancel();
          _silenceTimer = Timer(const Duration(seconds: 2), () {
            // Auto-stop & send after 2 seconds of silence
            _stopListening();
            _sendMessage();
          });
        },
      );
    } else {
      debugPrint("Speech not available");
    }
  }

  void _stopListening() {
    _speech.stop();
    _silenceTimer?.cancel();
    setState(() => _isListening = false);
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.3),
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDCC7A1), Color(0xFFF8F4EC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  backgroundImage: const AssetImage("assets/cat.png"),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Cat Assistant 🐾",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.brown),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(color: Colors.brown),

            // Chat bubble area
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.pets, color: Colors.brown, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _assistantReply.isEmpty
                          ? "Meow~ Ask me about jeepney routes! 🚌"
                          : _assistantReply,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Input field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Ask something...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: Colors.brown),
                  onPressed: _sendMessage,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Mic + loading row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  heroTag: "mic",
                  backgroundColor: Colors.brown,
                  onPressed: _isListening ? _stopListening : _startListening,
                  child: Icon(
                    _isListening ? Icons.mic_off : Icons.mic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                if (_isLoading)
                  const CircularProgressIndicator(color: Colors.brown),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
