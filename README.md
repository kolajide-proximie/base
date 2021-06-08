# Base repo used to test different automatic-changelog libs

## What does it contain

1. Base typescript node.js app

2. Github actions config to support trunk based development

3. Commands to build and test the app

4. Github actions configured to execute:

- on push to the repo
- when PR merged to master
- when pre-released
- when released

5. Automatic changelog generation happens only in: "released" pipeline.

6. This repo tests the intuit auto tool for generating changelogs and releases 
