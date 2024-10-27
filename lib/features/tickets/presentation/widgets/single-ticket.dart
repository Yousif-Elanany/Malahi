import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';

class TicketWidget extends StatelessWidget {
  final TicketModel ticket;
  final VoidCallback onTap;

  const TicketWidget({Key? key, required this.ticket, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Border radius for the card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                ticket.imageUrl,
                height: 150, // Height for the image
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Row 1: Title and Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      ticket.eventName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${ticket.price} SAR', // Assuming price is a double
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            // Row 2: Description and Favorite Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      ticket.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      ticket.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ticket.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      // Handle favorite action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
