# This is a build system for [credibilitycoalition.org](http://credibilitycoalition.org)

This is an environment for fast, synchronized browser refreshing as you edit Sass, HTML and Javascript.

## Overview

0. Install the npm  and node (eg. or the Node installer or on a mac using Brew using `brew install node`) 
0. Install ruby 2.x (eg with [rvm](https://rvm.io))
0. `make` — This will run the make file to install the build system (local and global npm modules, and ruby gems).
0. `npm start` — this will run middleman with bundler.
0. Edit .scss, .html and .js files. The browser should live-reload.

## This is a [Middleman](http://middlemanapp.com/) site

[Middleman](http://middlemanapp.com/) compiles our static site `build` from files in `source`.

Middleman is a ruby and markdown templating & routing system. When you work with middleman you are generating a static site that is generated in a `build` directory, but you only see the `source` files while you are working. When you are ready to make the static build of all your pages with all your templating logic re-run, you do `middleman build` (or in Meedan’s case, the build system does it for you). You have to do that before you deploy. Commit and push the latest `build` directory to deploy it. Middleman is designed for people who do this routine all day. 

## Quick start

* `make` (install dependencies)
* `npm start` (start middleman with bundler)

## Even quicker start: copy editing via github.com

If you want to just change some copywriting, you really don’t even need to set up the app locally. Copy edits can go in a yaml file like `en.yml`, for English.— https://github.com/meedan/meedan.com/blob/develop/locales/en.yml.

You can edit the copy using github.com by clicking ‘edit’ on that file. ^^

Make sure you are on the `develop` branch. 

How this works: With Middleman, templates in `source` are rendered with the values from `locales` and `data` directories (and potentially other dynamic content sources), then all the output static HTML goes to `build`. So, files in `build` are often erased and rewritten when you run `middleman build`, and your edit will not appear in the deployment.

Bonus: If you make a commit on the `develop` branch, the Jenkins server will pull your change to the server and run `middleman build` for you, deploying automatically to staging! And a bot will tell you about it in Slack. :zap:

Note: All copy writing needs to be localized. Consider editing directly into a translation manager instead of editing those files directly. 

## Installing dependencies

The code we use here is packaged with [Rubygems](http://rubygems.com/) and [NPM](https://www.npmjs.com/ "npm"). To get the build environment in place, run this in your terminal in the top level of this directory: 

  * `make setup`

Theoretically, that’s it. The makefile installs bundler and npm then does bundle install. After everything installs, you can hopefully run `npm start`.

## Local development

*:warning: Don't edit the files in `./build` :) * 

To work on the HTML and Sass, edit the files in `./source`. `npm start` will start the middleman compiler for both the stylesheets ([Sass](sass-lang.com/)) and the HTML. Middleman runs with livereload and should refresh the page automatically when you make changes.

## Getting extra logs from middleman

If you have issues you might want to see extra logging in. To run middleman directly without the `npm start` shortcut, to see more logging details: do `bundle exec middleman --verbose`.

## Adding a new member avatar

Update the contributor JSON. 

Convert the image to a reasonably sized square aspect ratio (200x200); to do a batch, you can use imagemagick in a bash script like this:

      for i in *; do convert "$i" -geometry 200x200^ -gravity center -crop 200x200+0+0 "$i"; done

## Adding a new partner logo
      
    - Use an svg file if possible, and optimize it with svgo.
    - For jpg or png files, create two versions, `@1x` (at least 100px) and `@2x` (at least 200px). Render both sizes (eg with [Sketch.app](https://www.sketchapp.com/ "Sketch - Professional Digital Design for Mac")) then do another pass on optimizing them. To optimize them you can do the best work with a bitmap program with good optimization settings ([Acorn](https://www.acorns.com/ "Acorns - Home")) or use the gulp task `gulp imagemin`. Check to make sure the file size is in the range of the other logos before committing a logo that is too big. The smaller size should be about 10k, the larger no more than 30k. Probably use a jpg for smallest file size. (Tip: If you're using Acorn or Photoshop, during the web export, try setting quality below 15%.)
    - Add the name of the file to the partner json file as described below.

### Updating the partner logo JSON

Once you have the new images, update `data/credco_logos.json` to include data about the new file, for example:

        {
          "name": "witness",
          "url": "https://witness.org/",
          "type": "png"
        }

The template loops through these values to create the logo-list sections. So, this will add the images to the page.

## Releasing new versions

Use `npm version (major|minor|patch)` to tag a new version in the [SemVer](http://semver.org/) style.

## Deploying

To deploy the files from the www directory to the gh-pages branch first tag a release like `npm version minor && git push && git push --tags`.
When the repo gets updated on github, an automatic build and deployment of the development site is triggered.

Then `git checkout master`, `git merge develop`, `git push`, and we use [jenkins](https://jenkins.io/ "Jenkins") to trigger the deploy.

## Sass structure

- Middleman compiles and Live-reloads the Sass for you.
- There are two files for each page: `shared.scss` and `page__[pagename].scss`. That `@imports` everything else. (We do it this way to ensure that we send the fewest possible lines of CSS to each page.)
- Then we import our Sass components, pages, and utility files from `source/stylesheets`.

Note: we are serving the site with [HTTP/2](https://http2.github.io/ "HTTP/2") so we no longer use image sprites, and we don't bundle all our CSS into a single file.

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

## Sass linting

If you're editing the Sass, probably you want to use a linter in your editor. For [Sublime Text 3](https://www.sublimetext.com/3): 

* Install [Sublime linter](http://www.sublimelinter.com/en/latest/ "Welcome to SublimeLinter 3 &mdash; SublimeLinter 3.4.24 documentation")
* npm install -g sass-lint
* Install [sass-lint](https://github.com/sasstools/sass-lint "GitHub - sasstools/sass-lint: Pure Node.js Sass linting")

## Sass Beautify

You can also use a [Sass beautify](https://github.com/badsyntax/SassBeautify) to make some changes automatically for you. 

To ensure the changes that the beautifier makes are compatible with the linter, the linter will read [sass-lint.yml] automatically. You'll need to set the Sass-beautify configuration options yourself by copying these entries into `Preferences > Package Settings > Sass Beautify > User Settings`: 

      {
        "indent": 2,
        "dasherize": false,
        "old": false,
        "path": false,
        "gemPath": false,
        "beautifyOnSave": true,
        "inlineComments": false,
        "newlineBetweenSelectors": true,
        "useSingleQuotes": true
      }

## Editorconfig-ing

Similar to Sass beautify, we use [Editorconfig](http://editorconfig.org/ "EditorConfig") to keep track of our settings for our editor. To use it with ST3, install the ST3 editorconfig plugin using `cmd`+`option`+`p`, then type "install", then search for "editorconfig".
