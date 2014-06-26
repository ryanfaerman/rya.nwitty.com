---
title: "Zencoder Node.js Module"
tags: [nodejs, api, open source]
alias: projects/2012/03/03/zencoder-nodejs-api.html
---

Recently I was working on a node.js project that involved some audio encoding and I hit my first project snag - I wanted to use Zencoder to deal with the actual transcoding but I couldn't find anything via `npm` that would help me out. Looks like it was time to start [shaving a yak](http://en.wiktionary.org/wiki/yak_shaving).

I quickly built a module that handles the entire spectrum of the Zencoder API, which thankfully is fairly well documented. Also, since we use Zencoder at the office, I already was fairly familiar with some of the zencoder fundamentals. 

You can find the module at its [github repository](https://github.com/ryanfaerman/node-zencoder), and it can easily be installed by running `npm install zencoder`. I'll be using this library myself and if I come across any issues, the fixes should end up in the module fairly quickly.

### Using the Module
Using the module is fairly straight-forward and when using Coffee-Script the code is very similar to the Ruby Gem that does the same thing. After installing the module (add it to your `package.json` - it's better for the environment), collect your API key from your Zencoder Account, and you're good to go.

Here's a quick example, just because examples are great.

```coffee

{Zencoder} = require 'zencoder'
Zencoder::api_key = 'YOUR-API-KEY'
 
Zencoder::Job.create 
  input: 's3://buckey/source.mp3'
  outputs: [
    format: 'mp4'
    url: 's3://bucket/output.mp4'
  ,
    format: 'mp3'
    url: 's3://bucket/output.mp3'
  ,
    format: 'ogg'
    url: 's3://bucket/output.ogg'
  ]
, (res) ->
  console.log res
  # Work with the initial job response
```

That's all it takes to create a new encoding job with three different output formats that will be stored in S3.

### Feedback
If you end up using the module, I've love to hear about it (it's always fun to hear about the projects that others are doing).

When you find any bugs, create an issue on the [github repository](https://github.com/ryanfaerman/node-zencoder) and I'll generally try to fix it.