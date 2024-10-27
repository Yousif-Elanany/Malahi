import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/core/presentation/widgets/header.dart';
import 'package:malahi_app/features/packs/presentation/widgets/packs_content.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_cubit.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_state.dart';
import 'package:malahi_app/features/tickets/presentation/pages/ticket_details_page.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/single-ticket.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/ticket_card.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/ticket_content.dart';

class PacksSearchPagePage extends StatefulWidget {
  @override
  _PacksSearchPagePageState createState() => _PacksSearchPagePageState();
}

class _PacksSearchPagePageState extends State<PacksSearchPagePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          // automaticallyImplyLeading: false,
          toolbarHeight: 100.0,
          title: Header(
            name: 'الباقات',
            subtitle: 'البحث',
          ),
        ),
        body: PacksContent());
  }
}
