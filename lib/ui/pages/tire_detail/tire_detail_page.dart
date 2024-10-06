import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/tire_detail/components/tire_detail_app_bar.dart';
import 'package:tirelist/ui/pages/tire_detail/components/tire_detail_body.dart';
import 'package:tirelist/ui/theme/measures.dart';
import 'package:tirelist/view_model/tire_detail_page_view_model.dart';

class TireDetailPage extends StatefulWidget {
  const TireDetailPage({super.key});

  @override
  State<TireDetailPage> createState() => _TireDetailPageState();
}

class _TireDetailPageState extends State<TireDetailPage> {

  final TireDetailPageViewModel _vm = TireDetailPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(
          Measures.APP_BAR_HEIGHT,
        ),
        child: TireDetailAppBar(),
      ),
      body: TireDetailBody(
        viewModel: _vm,
      ),
    );
  }
}