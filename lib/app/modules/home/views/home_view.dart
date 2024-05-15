import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: 150.0,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileSection(context),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverSearchBarDelegate(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        EventsList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            SizedBox(width: 40), // место для плавающей кнопки
            IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.mds.yandex.net/i?id=3ddb1ca5cd465f493db00d39c561eec97564a3b1-12884893-images-thumbs&n=13"),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ivan Kolobov',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Менеджер',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppbarButton(
                color: Colors.blue.shade100,
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
              AppbarButton(
                color: Colors.green.shade100,
                icon: Icon(Icons.group),
                onPressed: () {},
              ),
              AppbarButton(
                color: Colors.yellow.shade100,
                icon: Icon(Icons.star),
                onPressed: () {},
              ),
              AppbarButton(
                color: Colors.red.shade100,
                icon: Icon(Icons.calendar_today),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppbarButton extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Function() onPressed;

  const AppbarButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon: icon, onPressed: onPressed),
          )),
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SearchBar(),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Поиск события',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.filter_alt),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class EventsList extends StatelessWidget {
  final List<Map<String, String>> events = [
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
    {'date': '18 пн', 'event': 'Онлайн-конференция', 'time': '11:30 - 13:00'},
    {'date': '26 вт', 'event': 'День рождения Светланы', 'time': 'Весь день'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(event: event);
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, String> event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(event['event']!),
        subtitle: Text(event['time']!),
        leading: CircleAvatar(
          child: Text(event['date']!.split(' ')[0]),
        ),
      ),
    );
  }
}
