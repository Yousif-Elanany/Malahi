import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_cubit.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_state.dart';
import 'package:malahi_app/features/packs/presentation/pages/pack_details_page.dart';
import 'package:malahi_app/features/packs/presentation/widgets/packs_content.dart';
import 'package:malahi_app/features/packs/presentation/widgets/single-pack.dart';
import 'package:malahi_app/features/packs/presentation/widgets/pack_card.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';

class PacksPage extends StatefulWidget {
  @override
  _PacksPageState createState() => _PacksPageState();
}

class _PacksPageState extends State<PacksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PacksContent());
  }
}
