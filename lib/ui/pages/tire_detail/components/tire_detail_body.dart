import 'package:flutter/material.dart';
import 'package:tirelist/view_model/tire_detail_page_view_model.dart';

class TireDetailBody extends StatefulWidget {
  final TireDetailPageViewModel viewModel;
  const TireDetailBody({
    required this.viewModel,
    super.key,
  });

  @override
  State<TireDetailBody> createState() => _TireDetailBodyState();
}

class _TireDetailBodyState extends State<TireDetailBody> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
