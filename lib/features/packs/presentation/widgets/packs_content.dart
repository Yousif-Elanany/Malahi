import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_cubit.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_state.dart';
import 'package:malahi_app/features/packs/presentation/pages/pack_details_page.dart';
import 'package:malahi_app/features/packs/presentation/widgets/single-pack.dart';
import 'package:malahi_app/features/packs/presentation/widgets/pack_card.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';

class PacksContent extends StatefulWidget {
  @override
  _PacksContentState createState() => _PacksContentState();
}

class _PacksContentState extends State<PacksContent> {
  List<String> selectedCategories = []; // Multiple categories support
  String searchQuery = ''; // Default value for search query

  @override
  void initState() {
    super.initState();
    // Load initial packs and categories
    context.read<PacksCubit>().getPacks();
    // context.read<PacksCubit>().getCategories();
  }

  void _filterPacks() {
    context.read<PacksCubit>().getPacks(
          // categories: selectedCategories.isNotEmpty ? selectedCategories : null,
          searchQuery: searchQuery.isNotEmpty ? searchQuery : null,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Filter: This stays visible and doesn't get rebuilt
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
          child: _buildSearchInput(),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: _buildCategoryFilter(),
        // ),
        // Search Input: This also stays visible

        // Expanded section for packs that should change based on state
        Expanded(
          child: BlocListener<PacksCubit, PacksState>(
            listener: (context, state) {
              if (state is PacksError) {
                // Show an error message if there is an error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: BlocBuilder<PacksCubit, PacksState>(
              builder: (context, state) {
                if (state is PacksLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PacksLoaded) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.packs.length,
                      itemBuilder: (context, index) {
                        return PackWidget(
                          pack: state.packs[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PackDetailsPage(
                                  pack: state.packs[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (state is PacksError) {
                  return Center(child: Text(state.message));
                }
                return Container(); // Default case
              },
            ),
            /* Expanded(
              child: BlocBuilder<PacksCubit, PacksState>(
                builder: (context, state) {
                  if (state is PacksLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PacksLoaded) {
                    return Container(
                      // Optionally set a height if needed
                      // height: 300,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 10 / 10,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: state.packs.length,
                        itemBuilder: (context, index) {
                          return PackWidget(
                            pack: state.packs[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PackDetailsPage(
                                    pack: state.packs[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else if (state is PacksError) {
                    return Center(child: Text(state.message));
                  }
                  return Container(); // Default case
                },
              ),
            ), */ /* BlocBuilder<PacksCubit, PacksState>(
                builder: (context, state) {
                  if (state is PacksLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PacksLoaded) {
                    // Build list of packs only when loaded
                    return ListView.builder(
                      itemCount: state.packs.length,
                      itemBuilder: (context, index) {
                        return PackCard(
                          pack: state.packs[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PackDetailsPage(
                                  pack: state.packs[index],
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
    );
  }

  // Search input widget
  Widget _buildSearchInput() {
    return Container(
      height: 30.0,
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value; // Capture search query input
          });
          _filterPacks(); // Trigger pack filtering when search query changes
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
    return BlocBuilder<PacksCubit, PacksState>(
      builder: (context, state) {
        if (state is PacksCategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PacksCategoriesLoaded) {
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
                  _filterPacks(); // Trigger pack filtering when category is selected
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
        } else if (state is PacksCategoriesError) {
          return Center(child: Text(state.message));
        }
        return Container(); // Default case
      },
    );
  }
}
