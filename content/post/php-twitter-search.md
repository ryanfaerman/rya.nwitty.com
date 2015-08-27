+++
date = "2010-12-23T00:00:00-04:00"
title = "PHP Twitter Search API"
aliases = [
  "/projects/2010/12/23/php-twitter-search.html",
  "/php-twitter-search/index.html",
]
+++


I've implemented the twitter search API in a PHP class just for fun. It implements the entire search API as of February 25, 2009. I've only tested this with PHP 5.2.6 but I am fairly confident that most installations of PHP5 should work just fine. If you try it with PHP4 and it works (or if you have to jigger it) let me know.

You can check out the source code in the github repository: [ryanfaerman/php-twitter-search-api](https://github.com/ryanfaerman/php-twitter-search-api)

Here are a couple examples (after including the class):

This example makes use of method chaining to create a "sentence". Chaining isn't a requirement but I think it works here. What this example does is search for tweets from the user "ryanfaerman" with the hashtag "#flsccc".

```php
$search = new TwitterSearch();
$search->user_agent = 'phptwittersearch:ryan.faerman@gmail.com';

$results = $search->from('ryanfaerman')->with('flsccc')->results();
```

The user agent is optional, but is recommended. This way the folks over at Twitter know who is hitting their server. I'll be leaving it out in other examples for clarity.

If you want to put in the query during instantiation, you can do that too. Anything that you'd use on search.twitter.com can be passed as the argument. This example searches all twitter for any tweets that mention the word "monkey".

```php
$search = new TwitterSearch('monkey');
$results = $search->results();
```

Each time you add another search term, it is appended to the query you are building. Once you get the results, the query is cleared.

This example searches for the last 50 tweets from the user ?darthvader? where he mentions ?storm trooper?.

```php
$search->from('darthvader');
$search->contains('storm trooper');
$results = $search->rpp(50)->results();
```

This example searches for any tweets within a 25 mile radius of the provided coordinates.

```php
$results = $search->geocode(40.757929, -73.985506, 25)->results();
```

There are quite a few more search operators which are clear from the source code, so I encourage you to take a look.
Lastly, there is the trends function. Calling this method returns the top ten queries that are currently trending on Twitter.

```php
$trends = $search->trends();
```

If you end up using this in a project of yours, I'd really enjoy hearing about it.
