part of 'pages.dart';

// ignore: use_key_in_widget_constructors
class RulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    // final state =
    //     context.watch<FormViolationCubit>().state as FormViolationLoaded;
    return GeneralGradientPage(
      title: 'Peraturan',
      subtitle: 'Halaman Peraturan',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: BlocBuilder<FormViolationCubit, FormViolationState>(
            builder: (_, state) {
              if (state is FormViolationLoaded) {
                if (state.formv!.isEmpty) {
                  return Center(
                    child: Container(
                      child: Text('Data Not Found'),
                    ),
                  );
                }
                return Column(
                  children: state.formv!.asMap().entries.map((entry) {
                    int index = entry.key;
                    FormOfViolation formViolation = entry.value;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                        defaultMargin,
                        0,
                        defaultMargin,
                        16,
                      ),
                      child: FoulListItem(
                        formviolation: formViolation,
                        itemWidth: listItemWidth,
                        itemNumber: index + 1,
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
