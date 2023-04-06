import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/screens/home/content.dart';
import 'package:flutter_pkm_sw/widgets/layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(child: ContentHome(), homeTitle: 'Dashboard');
  }
}
