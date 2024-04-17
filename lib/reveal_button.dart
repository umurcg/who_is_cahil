import 'package:flutter/material.dart';

class RevealButton extends StatelessWidget{
  final VoidCallback onPressed;
  final VoidCallback onReleased;
  final String text;

  const RevealButton({
    required this.text,
    required this.onPressed,
    required this.onReleased
  });
  
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTapDown: (_) => onPressed(),
      onTapUp: (_) => onReleased(),
      onTapCancel:() => onReleased(),
      child: ElevatedButton(
        onPressed: (){},
        child: Text(text), 
      ),
    );
  }
}

