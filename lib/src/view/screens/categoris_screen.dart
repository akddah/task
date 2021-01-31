import 'package:flutter/material.dart';
import 'package:for_job/src/controller/categories_provider.dart';
import 'package:for_job/src/view/widget/helperWidget.dart';
import 'package:for_job/src/view/widget/networkImage.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedLevel2 = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    var provider = Provider.of<CategoriesProvider>(context, listen: false);
    await provider.getCategories();
    provider.categoriesList.first.categories.first.selected = true;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoriesProvider>(context, listen: true);
    return DefaultTabController(
      length: provider.categoriesList.length,
      child: provider.loading == true
          ? loader
          : Scaffold(
              appBar: AppBar(
                title: Text("Categories"),
                centerTitle: true,
                bottom: TabBar(
                  tabs: List.generate(
                    provider.categoriesList.length,
                    (index) {
                      return Text("${provider.categoriesList[index].name}");
                    },
                  ),
                ),
              ),
              body: TabBarView(
                children: List.generate(
                  provider.categoriesList.length,
                  (index) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: provider
                                .categoriesList[index].categories.length,
                            itemBuilder: (context, i) {
                              var item =
                                  provider.categoriesList[index].categories[i];
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedLevel2 = i;
                                    for (var a = 0;
                                        a <
                                            provider.categoriesList[index]
                                                .categories.length;
                                        a++) {
                                      if (a == i) {
                                        provider.categoriesList[index]
                                            .categories[a].selected = true;
                                      } else {
                                        provider.categoriesList[index]
                                            .categories[a].selected = false;
                                      }
                                    }
                                    print("($index , $selectedLevel2)");
                                  });
                                },
                                selected: item.selected,
                                selectedTileColor: Colors.blue,
                                title: Text(
                                  "${item.name}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: item.selected == true
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 5,
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(
                              provider.categoriesList[index]
                                  .categories[selectedLevel2].categories.length,
                              (i) {
                                var item = provider.categoriesList[index]
                                    .categories[selectedLevel2].categories[i];
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: networkImage(item.image),
                                        ),
                                      ),
                                      Text("${item.name}"),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
