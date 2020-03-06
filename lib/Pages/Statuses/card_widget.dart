import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/Pleroma/Models/card.dart' as CardModel;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatelessWidget {
  final CardModel.Card card;
  CardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        canLaunch(card.url).then((result) {
          launch(card.url);
        });
      },
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 0,
          maxHeight: 135.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black38,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (card.image != null)
                  AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: card.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (card.providerName != null)
                          Text(
                            card.providerName,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (card.title != null)
                          Text(
                            card.title,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (card.description != null)
                          Flexible(
                            child: Text(
                              card.description,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
