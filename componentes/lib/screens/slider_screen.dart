import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('slider && check'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
                min: 50,
                max: 400,
                activeColor: AppTheme.primary,
                //divisions: 10,

                value: _sliderValue,
                onChanged: _sliderEnabled
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                      }
                    : null),
            Checkbox(
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value ?? true;
                setState(() {});
              },
            ),
            CheckboxListTile(
              activeColor: AppTheme.primary,
              title: const Text(' Habilitar Slider'),
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                _sliderEnabled = value ?? true;
              }),
            ),
            Switch(
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value ?? true;
                    })),
                    
            SwitchListTile.adaptive(
                activeColor: AppTheme.primary,
                title: const Text(' Habilitar Slider'),
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value ?? true;
                    })),
              const AboutListTile(),        
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/b/bb/Gorgosaurus_BW_transparent.png'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
          ],
        ));
  }
}
