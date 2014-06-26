---
title: "Upgrading my CentOS Server"
tags: [centos, server]
alias: notebook/2012/04/20/upgrading-my-centos-server.html
---

My main server has been growing rather long in the tooth (CentOS 5.3) and until recently, I've been putting off actually doing something about it, since I'm just lazy. There were always a few "essential" domains and services that I couldn't risk going down and until recently, I just accepted that -- Until I couldn't anymore; A few things forced my hands. 

 1. Nginx doesn't really operate well with CentOS 5.3; I couldn't get it to run at all.
 2. Node.js started giving me issues with all the various cruft and versions of it that I've experimented with over the years.
 3. I kinda, sorta deleted my entire `sites` directory (I had backups!) which made me notice all the junk I've had in my trunk as I restored things.

Despite having less time than ever to spend on my server, I actually have less worries about things now than before, due, in part, to moving some of my critical DNS and such to Amazon Web Services. My website, for example, is hosted on S3 and generated on my end with Jekyll; I've moved the DNS for my primary domains to Amazon's Route 53 (it has a 100% uptime SLA!). The only downside of hosting my domain on S3, is that you can't point a naked domain to your S3 bucket; which means I still need my server to do a simple redirect from `ryanfaerman.com` to `www.ryanfaerman.com`. I also can't go without the dub-dubs, but the benefits far outweight the downsides here.

Enough introduction, on to the meat and potatoes.

## Backup all the things!
Backing up is probably the most important step. 

The things that I backed up before doing this potentially catastrophic system upgrade were:

 * Home directories. Pretty much everything in /home
 * Website directories. I had just about everything in /var/html/sites.
 * Any and all databases. I had both MySQL and MongoDB running.
 * Some old Subversion repositories. I'm all moved to git now, but history remains.
 * Apache, and a few other extraneous config files

I created tarballs or dumps where appropriate, downloaded them locally, then uploaded a copy to S3. I'll be keeping these backups there for a month or two - basically until I know things are stable enough.

## Upgrade all the things!
With backups out of the way and my mind mostly at ease, its time to run the monster command that starts this whole adventure rolling:

	yum update

Of course that hit a quick snag. Yum failed with a bunch of nasty error messages as soon as it hit updating some perl stuff. A quick search later, and I [discovered](http://blog.rowancrane.com/2009/05/13/yum-update-typeerror-unsubscriptable-object) that this is a fairly common error that is easily resolved.

	yum clean metadata

After that, I ran `yum update` again and after a few minutes, I was asked to confirm a 400+ megabyte download. Once that finishes its thing, it is time for one of the scariest commands: `reboot`. Giving the server 5 minutes or so to reboot (and being just slightly nervous), I give it a quick ping and it's back. 

## Installing all the things!
While I've gotten everything setup by manually building & configuring each service (I did take notes for this post, but they are verbose, boring, and soon to be outdated), I'm learning to use [Chef](http://www.opscode.com/chef/) to take care of it all in the future. Chef can also be used with [Vagrant](http://vagrantup.com/), a really slick VM provisioning tool that I'm looking to use as a development server. Setting up my mac isn't too much of a challenge, but it will let me switch machines a little faster and make collaboration easier.

Chef *should* make everything much simpler and easier to replicate when required and gives me much more flexibility should I ever decide to use something like Amazon EC2 (which I am considering). 

Even though [git-deploy](https://github.com/mislav/git-deploy) to push my various projects live, I've been using [Capistrano](http://www.capistranorb.com/) at work, and have really grown to enjoy using it. I'll likely move my projects to use it after dealing with the server stuff.


