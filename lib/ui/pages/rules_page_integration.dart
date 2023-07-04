// part of 'pages.dart';

// // ignore: use_key_in_widget_constructors
// class RulesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double listItemWidth =
//         MediaQuery.of(context).size.width - 2 * defaultMargin;

//     // final state =
//     //     context.watch<FormViolationCubit>().state as FormViolationLoaded;
//     return GeneralPage(
//         title: 'Rules',
//         subtitle: 'this is rules page',
//         onBackButtonPressed: () {},
//         child: ListView(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       BlocBuilder<FormViolationCubit, FormViolationState>(
//                           builder: (_, state) {
//                         if (state is FormViolationLoaded) {
//                           return Column(
//                             children: state.formv
//                                 .map((e) => Padding(
//                                       padding: EdgeInsets.fromLTRB(
//                                           defaultMargin, 0, defaultMargin, 16),
//                                       child: FoulListItem(
//                                           formv: e, itemWidth: listItemWidth),
//                                     ))
//                                 .toList(),
//                           );
//                         } else {
//                           return Center(
//                             child: loadingIndicatior,
//                           );
//                         }
//                       }),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ));
//   }
// }
