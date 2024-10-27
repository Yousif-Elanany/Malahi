import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_cubit.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_state.dart';
import 'package:malahi_app/features/tickets/presentation/pages/ticket_details_page.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/single-ticket.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/ticket_card.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/ticket_content.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TicketContent());
  }
}
