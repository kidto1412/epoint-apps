part of 'pages.dart';

class RulesPage extends StatelessWidget {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  // const RulesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Rules',
      subtitle: 'this is rules page',
      onBackButtonPressed: () {},
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Text(titles[index]),
              subtitle: Text(subtitles[index]),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
            ));
          }),
    );
  }
}
