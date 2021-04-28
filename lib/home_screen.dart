import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: false,
        titleSpacing: 16.0,
        elevation: 6.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            print('leading clicked');
          },
        ),
        title: InkWell(
          onDoubleTap: () {
            print('title double tap');
          },
          onTap: () {
            print('title single tap');
          },
          onLongPress: () {
            print('title long tap');
          },
          child: Text(
            'Blue Squad App',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('notifications clicked');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              print('search clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
          [
            Padding(
              padding: EdgeInsets.all(20.0,),
              child: Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: NetworkImage('https://themes.tielabs.com/sahifa/wp-content/uploads/sites/3/2015/01/9FybtVFNSEOxogGzIvHJ_IMG_2226.jpg'),
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Still, she’s got a lot of spirit. I don’t know, what do you think? What!? I don’t know what you’re talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan– What good is a reward if you ain’t around to use it? Besides, attacking that battle station ain’t my idea of courage. It’s more like…suicide.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                    [
                      Text(
                        'TRAVEL',
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0,),
              child: Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: NetworkImage('https://themes.tielabs.com/sahifa/wp-content/uploads/sites/3/2015/01/9FybtVFNSEOxogGzIvHJ_IMG_2226.jpg'),
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Still, she’s got a lot of spirit. I don’t know, what do you think? What!? I don’t know what you’re talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan– What good is a reward if you ain’t around to use it? Besides, attacking that battle station ain’t my idea of courage. It’s more like…suicide.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                    [
                      Text(
                        'TRAVEL',
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0,),
              child: Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: NetworkImage('https://themes.tielabs.com/sahifa/wp-content/uploads/sites/3/2015/01/9FybtVFNSEOxogGzIvHJ_IMG_2226.jpg'),
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Still, she’s got a lot of spirit. I don’t know, what do you think? What!? I don’t know what you’re talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan– What good is a reward if you ain’t around to use it? Besides, attacking that battle station ain’t my idea of courage. It’s more like…suicide.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                    [
                      Text(
                        'TRAVEL',
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0,),
              child: Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: NetworkImage('https://themes.tielabs.com/sahifa/wp-content/uploads/sites/3/2015/01/9FybtVFNSEOxogGzIvHJ_IMG_2226.jpg'),
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Still, she’s got a lot of spirit. I don’t know, what do you think? What!? I don’t know what you’re talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan– What good is a reward if you ain’t around to use it? Besides, attacking that battle station ain’t my idea of courage. It’s more like…suicide.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                    [
                      Text(
                        'TRAVEL',
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0,),
              child: Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: NetworkImage('https://themes.tielabs.com/sahifa/wp-content/uploads/sites/3/2015/01/9FybtVFNSEOxogGzIvHJ_IMG_2226.jpg'),
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Still, she’s got a lot of spirit. I don’t know, what do you think? What!? I don’t know what you’re talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan– What good is a reward if you ain’t around to use it? Besides, attacking that battle station ain’t my idea of courage. It’s more like…suicide.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                    [
                      Text(
                        'TRAVEL',
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 16.0,
                        ),
                        onPressed: ()
                        {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}