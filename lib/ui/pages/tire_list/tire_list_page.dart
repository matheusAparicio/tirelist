import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_list_body.dart';

class TireListPage extends StatefulWidget {
  const TireListPage({super.key});

  @override
  State<TireListPage> createState() => _TireListPageState();
}

class _TireListPageState extends State<TireListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TireListBody(),
    );
  }
}