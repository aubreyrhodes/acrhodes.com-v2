---
title: Automatically Deploy A Static Blog With Heroku
---
It turns out that a lot of my automation efforts so far this week have focused around this blog. The first big thing that I fixed was me having to manually build and sync the site with the S3 bucket that hosts it. Now I have a free heroku instance that looks for changes and pushes updates every hour.READMORE

As a prerequisite it helps to know how this site is setup. I use the [middleman gem](http://middlemanapp.com/) to turn a directory of markdown files into html. The source files are hosted on a private repository on github, and the built files are published using asset_sync to an S3 bucket. Middleman is smart enough not to publish articles with a date in the future, but I still had to run `middleman build` and `middleman sync` each day to publish any articles that I had written ahead of time.

The first step in automating this process was to write a bash script to publish the blog:

<script src="https://gist.github.com/4548116.js"></script><noscript>https://gist.github.com/4548116#file-deploy-sh</noscript>

This script checks out the git project, updates any gems as needed and then builds and deploys the script. It uses a [github authorization token](http://developer.github.com/v3/oauth/#get-a-single-authorization) to access the private repository.

To set up the heroku instance to deploy the blog for you, first create a new heroku app. Since we won't need the app to respond to web requests, turn the web dynos down to 0. Using git, push your deploy script to the app, and then add the [Heroku Scheduler](https://addons.heroku.com/scheduler) add-on to your app. From there just configure the scheduler to run your deploy script every hour like so:

![image](https://acr-skitch.s3.amazonaws.com/Heroku_Scheduler-20130116-105230.png)

This all works easily because the default build pack for heroku includes git and ruby and as long as your site doesn't take over an hour to build this falls under the free allotment of dyno time heroku allows you. Now I can front-load as many blog articles as I'd like without having to remember to publish them.