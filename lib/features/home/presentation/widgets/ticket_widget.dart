import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/core/presentation/widgets/ticket.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
// import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/tickets/presentation/pages/ticket_details_page.dart';

class TicketWidget extends StatelessWidget {
  final List<TicketModel> tickets;

  const TicketWidget({Key? key, required this.tickets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300, // Adjust the height as needed
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of cards per row
          childAspectRatio:
              10 / 15, // Adjust to change the aspect ratio of the cards
          crossAxisSpacing: 0.0, // Space between cards
          mainAxisSpacing: 2.0, // Space between rows
        ),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return TicketCoreWidget(
            ticket: tickets[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketDetailsPage(
                    ticket: tickets[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
