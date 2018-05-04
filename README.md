# This is a build system for [credibilitycoaltion.org](http://credibilitycoaltion.org)

This is an environment for fast, synchronized browser refreshing as you edit Sass, HTML and Javascript.

## Overview

0. Install the npm  and node (eg. or the Node installer or on a mac using Brew using `brew install node`) 
0. Install ruby 2.x (eg with [rvm](https://rvm.io))
0. `make` — This will run the make file to install the build system (local and global npm modules, and ruby gems).
0. `npm start` — this will run middleman with bundler.
0. Edit .scss, .html and .js files. The browser should live-reload.

## This is a [Middleman](http://middlemanapp.com/) site

[Middleman](http://middlemanapp.com/) compiles our static site `build` from files in `source`.

Middleman is a ruby and markdown templating & routing system. When you work with middleman you are generating a static site that is generated in a `build` directory, but you only see the `source` files while you are working. When you are ready to make the static build of all your pages with all your templating logic re-run, you do `middleman build` and commit the build directory — in Meedan’s case, the build system does it for you so you don't need to build before you deploy.

The build directory is ignored and rebuilt by the deployment process.

## Quick start

* `make` (install dependencies)
* `npm start` (start middleman with bundler)

## Even quicker start: copy editing via github.com

If you want to just change some copywriting, you really don’t even need to set up the app locally. Copy edits can go in a yaml file like `en.yml`, for English.— https://github.com/meedan/meedan.com/blob/develop/locales/en.yml.

You can edit the copy using github.com by clicking ‘edit’ on that file. ^^

Make sure you are on the `develop` branch. 

How this works: With Middleman, templates in `source` are rendered with the values from `locales` and `data` directories (and potentially other dynamic content sources), then all the output static HTML goes to `build`. So, files in `build` are often erased and rewritten when you run `middleman build`, and your edit will not appear in the deployment.

Bonus: If you make a commit on the `develop` branch, the Jenkins server will pull your change to the server and run `middleman build` for you, deploying automatically to staging! And a bot will tell you about it in Slack. :zap:

Note: If they copy needs to be localized consider editing into a translation manager instead of editing those files directly to the yml files.

## Installing dependencies

The code we use here is packaged with [Rubygems](http://rubygems.com/) and [NPM](https://www.npmjs.com/ "npm"). To get the build environment in place, run this in your terminal in the top level of this directory: 

  * `make setup`

Theoretically, that’s it. The makefile installs bundler and npm then does bundle install. After everything installs, you can hopefully run `npm start`.

## Local development of meedan.com

*:warning: Don't edit the files in `./build` :) * 

To work on the HTML and Sass, edit the files in `./source`. `npm start` will start the middleman compiler for both the stylesheets ([Sass](sass-lang.com/)) and the HTML. 

Middleman runs with livereload and should refresh the page automatically when you make changes.

Note: It does not do a full `build` on every save. It only live-updates files that have already been built. So if you make changes to a config file, or add new files you will likely need to run `middleman build`.

## Getting extra logs from middleman

If you have issues you might want to see extra logging in. To run middleman directly without the `npm start` shortcut, to see more logging details: do `bundle exec middleman --verbose`.

## Adding a new partner logo
      
    - Use an svg file if possible, and optimize it with svgo.
    - For jpg or png files, create two versions, `@1x` (at least 100px) and `@2x` (at least 200px). Render both sizes (eg with [Sketch.app](https://www.sketchapp.com/ "Sketch - Professional Digital Design for Mac")) then do another pass on optimizing them. To optimize them you can do the best work with a bitmap program with good optimization settings ([Acorn](https://www.acorns.com/ "Acorns - Home")) or use the gulp task `gulp imagemin`. Check to make sure the file size is in the range of the other logos before committing a logo that is too big. The smaller size should be about 10k, the larger no more than 30k. Probably use a jpg for smallest file size. (Tip: If you're using Acorn or Photoshop, during the web export, try setting quality below 15%.)
    - Add the name of the file to the partner json file as described below.

Once you have the new images, update the data files `supporter_logos.json` or `check_partners.json` to include data about the new file, for example:

        {
          "name": "witness",
          "url": "https://witness.org/",
          "type": "png"
        }

The template loops through these values to create the logo-list sections. So, this will add the images to the page.

## Adding a new team member

Hooray, a new team member! Like the logos, team member information is stored as JSON data. Take a peek in `data/team_members.json` and add a member (in alphabetical order) like so:

        {
          "name": "meedani",
          "fullname": "Me Meedani",
          "title": "Senior Advisor"
        }

Add a @1x version (200px, under 10kb) and a @2x version (400px, under 20kb) to `images/team/`.

## Adding a new page

- Create a `page__[pagename].scss` which imports the `shared` sass. That will ensure the basic CSS is in place for the page. 
- Add markup to `source/localizable`
- Add copy to `locales/en.yml` (and other locales as appropriate)
- If you are adding it to the top level navigation: Add the page name to pages array in the `partials/_nav.erb` template and add the page name to the pages array in `source/stylesheets/nav.scss`. That will ensure it appears and is styled correctly when active.

## Releasing new versions

Use `npm version (major|minor|patch)` to tag a new version in the [SemVer](http://semver.org/) style.

Then push your new commits and the new release with: `git push && git push --tags`

## Sass structure

- Middleman compiles and Live-reloads the Sass for you.
- There are two files for each page: `shared.scss` and `page__[pagename].scss`. That `@imports` everything else. (We have separate sass files for each page to ensure that we send the fewest possible lines of CSS to each page.)
- Then we import our Sass components, pages, and utility files from `source/stylesheets`.

Note: we are serving the site with [HTTP/2](https://http2.github.io/ "HTTP/2") so we no longer use image sprites, and we don't bundle all our CSS into a single file.

## Sass linting

We use Sass formatting guideliness that are captured in a `.stylelintrc` file — you can use a stylelint linter in your editor of choice by following instructions on the [Stylelint website](https://stylelint.io/)

## Running tests

There are integration tests operated by [casperjs](http://casperjs.org/ "CasperJS, a navigation scripting and testing utility for PhantomJS and SlimerJS"). Note that we use [slimerjs](https://slimerjs.org/ "SlimerJS") instead of [phantomjs](http://phantomjs.org/ "PhantomJS | PhantomJS") (for better redirection support as of July 2015).

We also do some accessibility tests with [a11y](https://github.com/addyosmani/a11y).

To run these integration tests:

- Install Slimer, Casper and a11y: `npm install -g slimerjs casperjs a11y`
- Install [firefox](https://www.mozilla.org/en-US/firefox/products/)
- If you're not on MacOS, tell Slimer where Firefox is by setting this variable `export SLIMERJSLAUNCHER=/path/to/firefox` before you run the test. If you are on MacOS it is done automatically.
- Then you should be able to run the tests with `npm run test`

## Travis 

Tests are run automatically when you push to github, using [Travis](https://travis-ci.org/ "Travis CI - Test and Deploy Your Code with Confidence").