//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
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
//     });
//
//     await _recorder.startRecorder(
//       toFile: _filePath,
//
//
//     );
//
//
//     Future.delayed(Duration(seconds: 60), () async {
//       if (_isRecording) {
//         await _stopRecording();
//
//       }
//     });
//   }
//
//   Future<void> _stopRecording() async {
//     await _recorder.stopRecorder();
//     setState(() {
//       _isRecording = false;
//     });
//   }
//
//   @override
//   void dispose() {
//     _recorder.closeRecorder();
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
//             ElevatedButton(
//               onPressed: _isRecording ? null : _startRecording,
//               child: Text('Start Recording'),
//             ),
//             ElevatedButton(
//               onPressed: _isRecording ? _stopRecording : null,
//               child: Text('Stop Recording'),
//             ),
//             SizedBox(height: 20),
//             Text(_isRecording ? 'Recording...' : 'Not Recording'),
//           ],
//         ),
//       ),
//     );
//   }
// }
