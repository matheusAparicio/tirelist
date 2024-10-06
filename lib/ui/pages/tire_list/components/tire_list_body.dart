import 'package:flutter/material.dart';
import 'package:tirelist/external/http_request.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_component.dart';

class TireListBody extends StatefulWidget {
  const TireListBody({super.key});

  @override
  State<TireListBody> createState() => _TireListBodyState();
}

HttpRequest httpRequest = HttpRequest();

class _TireListBodyState extends State<TireListBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TireComponent();
        },
      ),
    );
  }
}
