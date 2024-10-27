import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_cubit.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_state.dart';
import 'package:malahi_app/features/tickets/presentation/pages/ticket_details_page.dart';
import 'package:malahi_app/features/tickets/presentation/widgets/single-ticket.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';

class TicketContent extends StatefulWidget {
  @override
  _TicketContentState createState() => _TicketContentState();
}

class _TicketContentState extends State<TicketContent> {
  List<String> selectedCategories = []; // Multiple categories support
  String searchQuery = ''; // Default value for search query

  @override
  void initState() {
    super.initState();
    // Load initial tickets and categories
    context.read<TicketsCubit>().getTickets();
    // context.read<TicketsCubit>().getCategories();
  }

  void _filterTickets() {
    context.read<TicketsCubit>().getTickets(
          // categories: selectedCategories.isNotEmpty ? selectedCategories : null,
          searchQuery: searchQuery.isNotEmpty ? searchQuery : null,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundApp(),
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
              child: _buildSearchInput(),
            ),
            // Category Filter: This stays visible and doesn't get rebuilt
            /* Padding(
                padding: const EdgeInsets.all(8.0),
                // child: _buildCategoryFilter(),
              ), */
            // Search Input: This also stays visible

            // Expanded section for tickets that should change based on state
            Expanded(
              child: BlocListener<TicketsCubit, TicketsState>(
                listener: (context, state) {
                  if (state is TicketsError) {
                    // Show an error message if there is an error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: BlocBuilder<TicketsCubit, TicketsState>(
                  builder: (context, state) {
                    if (state is TicketsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is TicketsLoaded) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.tickets.length,
                          itemBuilder: (context, index) {
                            return TicketWidget(
                              ticket: state.tickets[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TicketDetailsPage(
                                      ticket: state.tickets[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    } else if (state is TicketsError) {
                      return Center(child: Text(state.message));
                    }
                    return Container(); // Default case
                  },
                ), /* BlocBuilder<TicketsCubit, TicketsState>(
                    builder: (context, state) {
                      if (state is TicketsLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is TicketsLoaded) {
                        // Build list of tickets only when loaded
                        return ListView.builder(
                          itemCount: state.tickets.length,
                          itemBuilder: (context, index) {
                            return TicketCard(
                              ticket: state.tickets[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TicketDetailsPage(
                                      ticket: state.tickets[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return Container(); // Default case for other states
                    },
                  ), */
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Search input widget
  Widget _buildSearchInput() {
    return Container(
      height: 30,
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value; // Capture search query input
          });
          _filterTickets(); // Trigger ticket filtering when search query changes
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: AppColors.gray,
                width: 1.0), // Border color when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: AppColors.gray,
                width: 1.0), // Change to your desired focus color
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 1.0), // Change to your desired error color
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Colors.red,
                width: 1.0), // Change to your desired focused error color
          ),
          hintText: 'إبحث عن أفضل التذاكر و العروض',
          iconColor: AppColors.gray,
          focusColor: AppColors.gray,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  // Category filter widget
  Widget _buildCategoryFilter() {
    return BlocBuilder<TicketsCubit, TicketsState>(
      builder: (context, state) {
        if (state is TicketsCategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TicketsCategoriesLoaded) {
          return Wrap(
            spacing: 8.0,
            children: state.categories.map((Category category) {
              bool isSelected =
                  selectedCategories.contains(category.id.toString());
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle category selection
                    if (isSelected) {
                      selectedCategories.remove(category.id.toString());
                    } else {
                      selectedCategories.add(category.id.toString());
                    }
                  });
                  // _filterTickets(); // Trigger ticket filtering when category is selected
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        } else if (state is TicketsCategoriesError) {
          return Center(child: Text(state.message));
        }
        return Container(); // Default case
      },
    );
  }
}
