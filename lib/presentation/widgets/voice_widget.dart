// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class AudioRecorderScreen extends StatefulWidget {
//   @override
//   _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
// }
//
// class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
//   FlutterSoundRecorder _recorder = FlutterSoundRecorder();
//   bool _isRecording = false;
//   String _filePath = 'audio_record.aac';
//
//   Timer? _timer;
//   int _recordDuration = 0; // Duration in seconds
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeRecorder();
//   }
//
//   Future<void> _initializeRecorder() async {
//     await Permission.microphone.request();
//     await _recorder.openRecorder();
//   }
//
//   Future<void> _startRecording() async {
//     setState(() {
//       _isRecording = true;
//       _recordDuration = 0;
//     });
//
//     await _recorder.startRecorder(
//       toFile: _filePath,
//       codec: Codec.aacADTS,
//     );
//
//     // Start timer to update duration
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _recordDuration++;
//       });
//     });
//
//     // Stop recording after 60 seconds
//     Future.delayed(Duration(seconds: 60), () async {
//       if (_isRecording) {
//         await _stopRecording();
//       }
//     });
//   }
//
//   Future<void> _stopRecording() async {
//     await _recorder.stopRecorder();
//     _timer?.cancel();
//     setState(() {
//       _isRecording = false;
//     });
//   }
//
//   String _formatDuration(int seconds) {
//     final minutes = seconds ~/ 60;
//     final remainingSeconds = seconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }
//
//   @override
//   void dispose() {
//     _recorder.closeRecorder();
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Recorder'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _isRecording ? _stopRecording : _startRecording,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 200),
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _isRecording ? Colors.yellow : Colors.grey[300],
//                     ),
//                   ),
//                   Icon(
//                     _isRecording ? Icons.stop : Icons.mic,
//                     size: 40,
//                     color: Colors.indigoAccent,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             if (_isRecording)
//               Text(
//                 _formatDuration(_recordDuration),
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             SizedBox(height: 20),
//             if (!_isRecording && _recordDuration > 0)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   LinearProgressIndicator(
//                     value: _recordDuration / 60,
//                     minHeight: 8,
//                     backgroundColor: Colors.grey[300],
//                     color: Colors.blue,
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     '$_recordDuration sec',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
