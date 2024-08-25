import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  static final updateId = 'homePageId';

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: ColorsValue.primaryColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
        ),
        child: GetBuilder<HomeController>(
          id: updateId,
          builder: (_controller) => GestureDetector(
            onTap: () {
              _controller.fromStationNode.unfocus();
              _controller.toStationNode.unfocus();
            },
            child: Scaffold(
              drawer: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: ColorsValue.primaryColor,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarDividerColor: Colors.white,
                ),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              appBar: AppBar(
                backgroundColor: ColorsValue.primaryColor,
                centerTitle: false,
                title: Text(
                  'Find My Train',
                  style: TextStyle(
                    color: ColorsValue.color36454F,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                children: [
                  Dimense.boxHeight(10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    borderOnForeground: false,
                    color: ColorsValue.color36454F,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: Get.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                            child: TypeAheadTextFieldCustomWidget<StationData>(
                              prefixIcon: const Icon(
                                Icons.my_location_outlined,
                                color: Colors.white,
                              ),
                              suffixIcon: _controller.selectedFromStation ==
                                      null
                                  ? null
                                  : InkWell(
                                      onTap: () {
                                        _controller
                                            .onClearFromStationField(updateId);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                              controller: _controller.fromStationController,
                              focusNode: _controller.fromStationNode,
                              hintText: 'From',
                              suggestionsCallback: (search) async =>
                                  await _controller.onStationSearch(search),
                              onSelected: (value) {
                                _controller.onSelectFormStation(
                                  value,
                                  updateId,
                                );
                              },
                              onChanged: (value) {
                                _controller.onChangeFromStation(
                                  value,
                                  updateId,
                                );
                              },
                              selectedStationData:
                                  _controller.selectedFromStation,
                            ),
                          ),
                          Stack(
                            children: [
                              const SizedBox(
                                height: 42,
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: -3,
                                right: 55,
                                child: IconButton(
                                  onPressed: () async {
                                    _controller.swipeStationValue(updateId);
                                  },
                                  icon: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.swap_vert_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45,
                            child: TypeAheadTextFieldCustomWidget<StationData>(
                              controller: _controller.toStationController,
                              focusNode: _controller.toStationNode,
                              hintText: 'To',
                              suffixIcon: _controller.selectedToStation == null
                                  ? null
                                  : InkWell(
                                      onTap: () {
                                        _controller
                                            .onClearToStationField(updateId);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                              suggestionsCallback: (search) async =>
                                  await _controller.onStationSearch(search),
                              onSelected: (value) {
                                _controller.onSelectToStation(value, updateId);
                              },
                              onChanged: (value) {
                                _controller.onChangeToStation(value, updateId);
                              },
                              selectedStationData:
                                  _controller.selectedToStation,
                            ),
                          ),
                          Dimense.boxHeight(10),
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              _controller.onValidateFindTrainsButton(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ColorsValue.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Find trains',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dimense.boxHeight(10),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: ColorsValue.color36454F,
                    child: InkWell(
                      onTap: () async {
                        RoutManagement.goToFindTrainsPage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.train,
                                  color: Colors.white,
                                ),
                                Dimense.boxWidth(20),
                                const Text(
                                  'Train No. / Train Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: const Center(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
