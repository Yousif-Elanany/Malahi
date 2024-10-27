import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/features/home/domain/cubit/home_cubit.dart';
import 'package:malahi_app/features/home/presentation/widgets/pack_carousel.dart';
import 'package:malahi_app/features/home/presentation/widgets/slide_carousel.dart';
import 'package:malahi_app/features/home/presentation/widgets/ticket_carousel.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger the fetch of slides, tickets, and packs when the page loads
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundApp(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                // Display a loading indicator while the data is being fetched
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                // When data is loaded, display slides, tickets, and packs
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Slides section
                        SlideCarousel(slides: state.slides),
                        Row(
                          children: [
                            Expanded(
                              child: PackCarousel(packs: state.packs),
                            ),
                            SizedBox(width: 10), // Space between carousels
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/tickets_search');
                                  },
                                  child:
                                      TicketCarousel(tickets: state.tickets)),
                            ),
                          ],
                        ),

                        // SizedBox(height: 20), // Add some spacing

                        // Tickets section

                        /* SectionWithButton(
                          sectionTitle: "افظل التذاكر",
                          onPressed: () {
                            // Your action on button press
                            print("Button Pressed التذاكر-!");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TicketsSearchPage(),
                              ),
                            );
                          },
                        ),
                        TicketWidget(tickets: state.tickets),
                    
                        SizedBox(height: 20), // Add some spacing
                    
                        // Packs section
                        SectionWithButton(
                          sectionTitle: "افظل الباقات",
                          onPressed: () {
                            // Your action on button press
                            print("Button Pressed -- الباقات !");
                    
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PacksSearchPagePage(),
                              ),
                            );
                          },
                        ),
                        PackWidget(
                          packs: state.packs,
                        ),
                        SizedBox(
                          height: 20,
                        ), */
                      ],
                    ),
                  ),
                );
              } else if (state is HomeError) {
                // Display an error message if something went wrong
                return Center(child: Text('Failed to load data'));
              }

              return Container(); // Default empty state
            },
          ),
        ],
      ),
    );
  }
}
