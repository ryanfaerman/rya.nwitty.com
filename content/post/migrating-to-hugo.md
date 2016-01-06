+++
date = "2016-01-05T00:24:00-04:00"
title = "Migrating to Hugo"
+++

I like to play with different technology to build websites. And, like a mad scientist, I generally experiment on myself and my own site.

My website was fairly recently powered by Middleman{{% sidenote %}}Middleman is great and all but I've become a gopher.![a happy gopher](/assets/gopher-with-flag.png){{% /sidenote %}} and now it isn't. I've moved everything over to use Hugo instead.

Hugo is pretty neat. Other than being written in Go, it's also distributed as a single binary without any external dependency. I don't need to get a ruby environment setup{{% sidenote %}}Don't get me wrong, I like ruby but if you've ever had to [resolve dependency conflicts](http://devblog.avdi.org/2015/08/11/what-its-like-to-come-back-to-a-ruby-project-after-6-months/), you know what I'm talking about.{{% /sidenote %}} or fight with any dependencies.

Hugo, like the Middleman, Jekyll, and nanoc I used before it, is a static site generator. Despite being a software engineer and working daily operating an internal cloud, I've come to really appreciate having a pile of files. I can serve this with just about any web server with little or no configuration.

As an added bonus, since there isn't any server-side generation, just about any server could handle an incredible amount of traffic.

I'm a realist, I know that no one is really looking at my content.{{% sidenote %}}Except you. You're a somebody... yea!{{% /sidenote %}} I don't create it for most people, I write it mostly for myself. Knowing that, I want to spend as little as possible to host my personal site. The less it costs the better. To that end, I'm hosting this site on Amazon S3 and fronting it with CloudFront.

Yes. Using CloudFront for my little site is overkill but it's the best way I could come up with to serve everything over SSL.{{% sidenote %}}Come on! [Let's Encrypt](https://letsencrypt.org) already!{{% /sidenote %}}

## Built on the Shoulders of Giants

First, we have the design of the site. I was greatly inspired by [Tufte-css](https://edwardtufte.github.io/tufte-css/); when I first saw that page I was blown away by the typography and especially the side notes. I felt that the design supported the type of writing that I enjoy, where I can interject{{% sidenote %}}Saving literally dozens of dollars on parentheses and dashes. Punctuation doesn't grow on trees you know!{{% /sidenote %}} into my own writing.

A pretty face only gets you so far.

With the design and content generation figured out, it was time to get this up to Amazon S3. In line with the style of Hugo, I pulled two more tools off the shelf:  [s3cmd](https://github.com/s3tools/s3cmd) and [awscli](https://github.com/aws/aws-cli).

Sprinkle in a bit of bash{{% sidenote %}}Based off the work by [Nicholas Whitter](http://imperialwicket.com/automatically-deploy-hugo-to-s3-and-cloudfront/).{{% /sidenote %}}, I now had a git post-commit hook done that:

1. Compiles the site with hugo
2. Uploads the site to Amazon S3
3. Purges the `index.html` file from CloudFront

## Done for now

Just like this wasn't the first iteration of my site, this won't be the last. After all the journey is most of the fun with this stuff.
