# This is a build system for credibilitycoalition.org

This environment uses Jekyll with Contentful. It uses Contentful's [Jekyll-Contentful-Data-Import](https://github.com/contentful/jekyll-contentful-data-import) plugin. See the readme on the repository page to learn how to configure data import.

## Quick start
1. Install Ruby 2.x (eg with [rvm](https://rvm.io))
2. `bundle install` or `bundle install --path vendor/bundle` to install all the packages
3. Add Contentful Space and Access Token variables to your shell's configuration file (.bashrc or .bash_profile):

```
export CONTENTFUL_CC_SPACE_ID=abc123
export CONTENTFUL_CC_ACCESS_TOKEN=abc123
export CONTENTFUL_ENVIRONMENT=develop
```

Variables are set in the contentful section of `_config.yml`. Get your Contentful space id and access token using the [Contentful web app](https://app.contentful.com/). Open the space that you want to access (the top left corner lists all spaces), and navigate to the *Settings > API keys*. Select the *API keys* option and there should be an existing API key under *Microsite* for Popup.news.
  
And run `source ~/.bashrc` or open new terminal to enable changes.

4. `bundle exec jekyll contentful --rebuild` to build the site by fetching content from Contentful 
5. `bundle exec jekyll serve` to serve the site at [http://127.0.0.1:4000](http://127.0.0.1:4000)
6. Edit .scss, .html and .js files. The browser should live-reload.

## Deploy settings on Netlify

credibilitycoalition.org is deployed on Netlify. Adding a website on Netlify is super easy. All these settings are under [Build & Deploy](https://app.netlify.com/sites/credco/settings/deploys) section of [Netlify's web app](https://app.netlify.com). Here are the main steps:

1. Select which Github repository and branch to deploy.
2. Specify this build command: `CONTENTFUL_ENVIRONMENT=master jekyll contentful --rebuild`
3. Add build environment variables `CONTENTFUL_CC_SPACE_ID` and `CONTENTFUL_CC_ACCESS_TOKEN`. `CONTENTFUL_ENVIRONMENT` is specified with the build command so no need to add it as an environment variable.
4. Add build hooks for Contentful's master and develop environment. Get the webhook urls using the [Contentful web app](https://app.contentful.com). Open the space and navigate to the *Settings > Webhooks*. You will see two webhooks already setup. See their details to copy the url or adjust what triggers it. See Contentful's [Intro to webhooks](https://www.contentful.com/developers/docs/concepts/webhooks/) to learn more.
5. To configure custom build command for deploying changes made to the Develop environment in Contentful, use Netlify's [Deploy Contexts](https://www.netlify.com/docs/continuous-deployment/#deploy-contexts) to specify the build command in a [netlify.toml](https://github.com/meedan/popupnewsroom/blob/master/netlify.toml) file. To deploy develop use this build command: `CONTENTFUL_ENVIRONMENT=develop bundle exec jekyll contentful --rebuild`

See [Continuous Deployment](https://www.netlify.com/docs/continuous-deployment) on Netlify docs to learn more.
