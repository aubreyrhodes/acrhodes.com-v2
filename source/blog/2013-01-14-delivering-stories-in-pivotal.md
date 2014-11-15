---
title: Automatically Delivering Pivotal Stories After a Deploy
---
Since I'm trying to cut down on the amount of computer minutiae I preform this week, I decided trying to tackle keeping my [Pivotal](http://www.pivotaltracker.com/) story statuses lined up with the state of my git repos. READMORE My normal workflow is to start a story in the PT web app, complete some commits, push my commits to github, finish the story in the PT web app, deploy my code to production, and finally deliver the stories in the web app. This is a little bit too much ceremony for me.

Luckily, Pivotal Tracker has very good git communication. After hooking up the [github service hook](http://pivotallabs.com/github-service-hook-for-pivotal-tracker/) for the project, I can now include `[Finishes #STORY_NUMBER]` in the commit message and the story's status is automatically updated.

As for deploys, the Pivotal API offers a `deliver_all_finished` endpoint that you can use to close out stories. If you have a deploy rake task add the following to run after a successful deploy:

    sh "curl -o /dev/null -H \"X-TrackerToken: #{PT_TOKEN}\" -X PUT
    http://www.pivotaltracker.com/services/v3/projects/#{PT_PROJECT_ID}/stories/deliver_all_finished"

<br />
Where `PT_TOKEN` is your Pivotal API token and `PT_PROJECT_ID` is your project's id.