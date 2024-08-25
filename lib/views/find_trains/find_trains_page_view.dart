import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

class FindTrainsPageView extends StatelessWidget {
  const FindTrainsPageView({super.key});
  final updateId = 'find-trains-page';

  @override
  Widget build(BuildContext context) => GetBuilder<FindTrainsController>(
        id: updateId,
        builder: (_controller) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: ColorsValue.primaryColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.white,
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: ColorsValue.colorEAEBF0,
              appBar: PreferredSize(
                preferredSize: Size(
                  Get.width,
                  Get.height,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  color: ColorsValue.primaryColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                          ),
                          Dimense.boxWidth(15),
                          HeaderFiltersButtonWidget(
                            onFilterChange: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) =>
                                    DayFilterBottonSheetWidget(
                                  updateId: updateId,
                                ),
                              );
                            },
                            value: _controller.selectedDayFiltersValue ==
                                    DayFilters.custom
                                ? '${Utility.returnFormatedDate(_controller.selectedFilterDate)}'
                                : _controller.selectedDayFiltersValue.label,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert_outlined,
                            size: 20,
                          ),
                        ],
                      ),
                      Dimense.boxHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'NGP-Nagpur',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Dimense.boxWidth(20),
                          const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                          Dimense.boxWidth(20),
                          const Text(
                            'NSDSL-New Delhi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: _controller.trainsResponseDataList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = _controller.trainsResponseDataList[index];
                  return Card(
                    margin: const EdgeInsets.only(top: 10),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadowColor: Colors.white,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Dimense.boxHeight(5),
                              Text(
                                data.trainName ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Utility.return12HourseFormat(
                                            data.fromStd ?? ''),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: ColorsValue.color36454F,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        data.fromSta ?? '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text('------'),
                                          Dimense.boxWidth(2),
                                          Text(data.duration ?? ''),
                                          Dimense.boxWidth(2),
                                          const Text('------'),
                                        ],
                                      ),
                                      Row(
                                        children:
                                            (data.runDays?.convertDays() ?? [])
                                                .map(
                                                  (e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: Text(
                                                      e.day,
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        decorationThickness: 3,
                                                        color: e.isAvailable
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Utility.return12HourseFormat(
                                            data.toStd ?? ''),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: ColorsValue.color36454F,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        data.toSta ?? '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Dimense.boxHeight(10),
                              TrainCalassTypeCardWidget(
                                data: data,
                                isValueSelectd: false,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsValue.primaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            data.trainNumber ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}

class TrainCalassTypeCardWidget extends StatelessWidget {
  const TrainCalassTypeCardWidget({
    super.key,
    required this.data,
    required this.isValueSelectd,
  });

  final FindTrainResponse data;
  final bool isValueSelectd;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 54,
        width: Get.width,
        child: ListView.separated(
          itemCount: data.classType?.length ?? 0,
          separatorBuilder: (context, index) => Dimense.boxWidth(10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => UnconstrainedBox(
            child: isValueSelectd
                ? InkWell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsValue.primaryColor.withOpacity(.2),
                          ),
                          child: Center(
                            child: Text(
                              data.classType?[index] ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.classType?[index] ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Refresh',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Dimense.boxWidth(10),
                                const Icon(Icons.refresh)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      );
}

class DayFilterBottonSheetWidget extends StatelessWidget {
  const DayFilterBottonSheetWidget({
    super.key,
    required this.updateId,
  });

  final String updateId;

  @override
  Widget build(BuildContext context) => GetBuilder<FindTrainsController>(
      id: updateId,
      builder: (_controller) => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Choose the date when the train start form New Delhi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Dimense.boxHeight(30),
                RadioListTile<DayFilters>(
                  value: DayFilters.today,
                  groupValue: _controller.selectedDayFiltersValue,
                  onChanged: (value) async {
                    _controller.onChangeDayFilter(value!, updateId, context);
                  },
                  title: const Text('Today'),
                  contentPadding: const EdgeInsets.all(0),
                ),
                RadioListTile<DayFilters>(
                  value: DayFilters.tomorrow,
                  groupValue: _controller.selectedDayFiltersValue,
                  onChanged: (value) {
                    _controller.onChangeDayFilter(value!, updateId, context);
                  },
                  title: const Text('Tomorrow'),
                  contentPadding: const EdgeInsets.all(0),
                ),
                RadioListTile<DayFilters>(
                  value: DayFilters.custom,
                  groupValue: _controller.selectedDayFiltersValue,
                  onChanged: (value) {
                    _controller.onChangeDayFilter(value!, updateId, context);
                  },
                  title: const Text('Choose from Calendar'),
                  contentPadding: const EdgeInsets.all(0),
                ),
                Dimense.boxHeight(20),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    Get.back<void>();
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
                        'Cancel',
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
          ));
}

class HeaderFiltersButtonWidget extends StatelessWidget {
  const HeaderFiltersButtonWidget({
    super.key,
    required this.value,
    required this.onFilterChange,
  });

  final String value;
  final VoidCallback onFilterChange;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onFilterChange,
        child: Container(
          width: 120,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      );
}

extension DayConverter on List<String> {
  List<AvailableDay> convertDays() {
    final dayMap = {
      'Mon': 'M',
      'Tue': 'T',
      'Wed': 'W',
      'Thu': 'T',
      'Fri': 'F',
      'Sat': 'S',
      'Sun': 'S',
    };
    final availableDays = <AvailableDay>[];

    final allDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (var day in allDays) {
      final dayChar = dayMap[day]!;
      final available = contains(day);
      availableDays.add(AvailableDay(day: dayChar, isAvailable: available));
    }

    return availableDays;
  }
}

class AvailableDay {
  AvailableDay({
    required this.day,
    required this.isAvailable,
  });
  final String day;
  final bool isAvailable;
}
