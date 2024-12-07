import 'package:data_table_2/data_table_2.dart';
import 'package:earth_eye_web/common/widgets/loaders/animation_loader.dart';
import 'package:earth_eye_web/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniPaginatedDataTable extends StatelessWidget {
  const UniPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.dataRowHeight = UniSizes.xl * 2,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.minWidth = 1000,
  });

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double minWidth, tableHeight, dataRowHeight;

  @override
  Widget build(BuildContext context) {
    return Theme(
      //use to set the background color
      data: Theme.of(context).copyWith(
        cardTheme: const CardTheme(color: UniColors.white, elevation: 0),
      ),
      child: SizedBox(
        height: tableHeight,
        child: PaginatedDataTable2(
          //data and sizing
          columns: columns,
          source: source,
          minWidth: minWidth,
          rowsPerPage: rowsPerPage,
          columnSpacing: 12,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: dataRowHeight,

          //Sorting
          sortAscending: sortAscending,
          sortArrowAlwaysVisible: true,
          sortArrowIcon: Icons.line_axis,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (bool ascending, bool sorted) {
            if (sorted) {
              return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                  size: UniSizes.iconSm);
            } else {
              return const Icon(Iconsax.arrow_3, size: UniSizes.iconSm);
            }
          },

          //Pagination
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},

          //Header Design
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith(
              (state) => UniColors.primaryBackground),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UniSizes.borderRadius),
              topRight: Radius.circular(UniSizes.borderRadius),
            ),
          ),
          empty: const UniAnimationLoaderWidget(
              text: "Nothing Found",
              animation: UniImages.emptyCart,
              height: 200,
              width: 200),

          //Check box
          showCheckboxColumn: true,
        ),
      ),
    );
  }
}
