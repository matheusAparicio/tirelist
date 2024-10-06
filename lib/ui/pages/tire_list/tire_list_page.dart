import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_list_app_bar.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_list_body.dart';
import 'package:tirelist/ui/theme/measures.dart';

class TireListPage extends StatefulWidget {
  const TireListPage({super.key});

  @override
  State<TireListPage> createState() => _TireListPageState();
}

class _TireListPageState extends State<TireListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          Measures.APP_BAR_HEIGHT,
        ),
        child: TireListAppBar(),
      ),
      body: TireListBody(),
    );
  }
}
