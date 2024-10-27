import 'package:flutter/material.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';

class TicketCard extends StatelessWidget {
  final TicketModel ticket;
  final VoidCallback onTap;

  const TicketCard({
    Key? key,
    required this.ticket,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.eventName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Category: ${ticket.category}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Date: ${ticket.date}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Price: \$${ticket.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8.0),
              if (ticket.description != null && ticket.description!.isNotEmpty)
                Text(
                  ticket.description!,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
