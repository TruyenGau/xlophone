import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo binding đã được khởi tạo
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  final AudioPlayer player = AudioPlayer(); // Sử dụng AudioPlayer thay vì AudioCache

  void playSound(int noteNumber) async {
    await player.setSource(AssetSource('note$noteNumber.wav')); // Phát âm thanh từ assets
    player.resume(); // Phát âm thanh
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Sử dụng backgroundColor thay vì primary
        ),
        child: null, // Không có nội dung hiển thị
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, noteNumber: 1),
          buildKey(color: Colors.orange, noteNumber: 2),
          buildKey(color: Colors.yellow, noteNumber: 3),
          buildKey(color: Colors.green, noteNumber: 4),
          buildKey(color: Colors.teal, noteNumber: 5),
          buildKey(color: Colors.blue, noteNumber: 6),
          buildKey(color: Colors.purple, noteNumber: 7),
        ],
      ),
    );
  }
}
