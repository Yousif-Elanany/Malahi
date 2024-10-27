import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/app_bar_back.dart';
import 'package:malahi_app/core/widgets/custom_accordion.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';

class TicketDetailsPage extends StatelessWidget {
  final TicketModel ticket;

  const TicketDetailsPage({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/images/onboarding1.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                    ))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticket.eventName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(ticket
                            .city), // Assuming 'ticket.city' holds the city name
                        SizedBox(
                            width: 5), // Spacing between icon and city name
                        Icon(Icons.location_on_outlined), // Icon for city
                      ],
                    ),
                  ],
                ),
                Text(ticket.address ?? ''),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, size: 20, color: AppColors.secondary),
                        Icon(Icons.star, size: 20, color: AppColors.secondary),
                        Icon(Icons.star, size: 20, color: AppColors.secondary),
                        Icon(Icons.star, size: 20, color: AppColors.secondary),
                        Icon(Icons.star, size: 20, color: AppColors.secondary),
                      ],
                    ),
                    Row(
                      children: [
                        Text(ticket
                            .date), // Assuming 'ticket.city' holds the city name
                        SizedBox(
                            width: 5), // Spacing between icon and city name
                        Icon(Icons.access_time), // Icon for city
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.book, // Change this to any icon you prefer
                      color: Colors.white, // Icon color
                    ),
                    label: Text(
                      'حجز التذكرة ${ticket.price.toString()}',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 18, // Adjust the font size as needed
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primary, // Button background color
                      padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15), // Button padding to make it large
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Rounded corners (optional)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'الوصف',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  ticket.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomAccordion(
                  title: 'العروض',
                  content: ticket.seller.offers,
                ),
                CustomAccordion(
                  title: 'الفروع',
                  content: ticket.seller.branches,
                ),
                CustomAccordion(
                  title: 'الموقع',
                  content: [ticket.seller.address],
                ),
                CustomAccordion(
                  title: 'مواعيد العمل',
                  content: ticket.seller.workingHours,
                ),
              ],
            ),
          ),
        ));
  }
}
