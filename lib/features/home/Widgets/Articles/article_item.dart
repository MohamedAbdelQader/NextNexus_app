import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/Remote/Articles_Response/Article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
final Article article;

  const ArticleItem({required this.article}) ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 232.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Placeholder background color
          ),
          child: Image.network(
            article.urlToImage?.isNotEmpty == true
                ? article.urlToImage!
                : "https://via.placeholder.com/232",
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null, // Display progress if available
                ),
              );
            },
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return Icon(
                Icons.broken_image,
                size: 50.sp,
                color: Colors.grey,
              ); // Display an error icon
            },
          ),
        ),

        Text( article.source?.name??"",style: Theme.of(context).textTheme.titleMedium,),
        Text( article.title??"",style: Theme.of(context).textTheme.titleSmall,),
        Align
            (alignment: Alignment.centerRight,
            child: Text( timeago.format(DateTime.parse(article.publishedAt??"")),
              style: Theme.of(context).textTheme.bodySmall,))

      ],
    );
  }
}
