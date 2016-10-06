# Deprecated sample - not maintained anymore (Summer 2016)

# sample-ruby-on-rails-app-prototyping

[![Ruby](https://img.shields.io/badge/Ruby-v2.2.2-red.svg)](https://www.ruby-lang.org/en/)
[![Rails](https://img.shields.io/badge/Rails-v4.2.2-brightgreen.svg)](http://rubyonrails.org/)
[![LMV](https://img.shields.io/badge/View%20%26%20Data%20API-v1.2.15-green.svg)](http://developer-autodesk.github.io/)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://opensource.org/licenses/MIT)


<b>Note:</b> For using this sample, you need a valid oAuth credential for the translation / extraction portion.
Visit this [page](https://developer.autodesk.com) for instructions to get on-board.


## Links
[Ruby Gem adn_viewer](https://rubygems.org/gems/adn_viewer) <br />
[ADN website](https://developer.autodesk.com/) <br />
[How the API Works and sample code](https://developer.autodesk.com/api/view-and-data-api/) <br />
[Live Sample](http://developer-autodesk.github.io/LmvQuickStart/) <br />

## Motivation

Our View and Data API Beta adds powerful 2D and 3D viewing functionality to your web apps.
Our REST and JavaScript API makes it easier to create applications that can view, zoom and interact with 2D and
3D models from over 60+ model formats with just a web browser, no plugin required!

This app shows you what you can do with the API.


## Description

This Ruby on Rails application is meant to allow users to register and upload models made in over 60 different file formats. Users can store URNs, view their uploaded models and set publically visible viewables. A judge password allows judges to register and view the user set viewables. Go get your consumer key and secret at developer.autodesk.com!



Here is a simple documented ruby on rails app built using this gem: [adn_viewer_gem_test_app](https://github.com/prathamalag1994/adn_viewer_gem_test_app). The tutorial in this repo is highly recommended for all Ruby developers using this gem. 

The gem source code can be found here: [adn_viewer](https://github.com/Developer-Autodesk/adn_viewer)

##Setup

If you would like to setup this app locally, please follow these steps:

Follow the instructions here to install Ruby and Ruby on Rails: [rubyonrails.org/download](http://rubyonrails.org/download/). <br />
Note: some sort of package management is recommended with Ruby and RoR. For example, [RVM](https://rvm.io/) is perfect for the job.  <br />
Once you've downloaded Ruby, install Rails (this can take a very long while):
```
gem install rails
```
Clone this repo onto your own machine and go into the directory of the app: ```cd sample-ruby-on-rails-app-prototyping```

IMPORTANT: Add the appropriate secrets.yml and database.yml files to the config folder. These have been deleted for security reasons. <br />
Now install the bundle and migrate the databases:
```
bundle install
rake db:migrate
rake db:setup
```

Finally fire up a server and voila, your app works!
```
rails server
```



--------

## License

This sample is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT). Please see the [LICENSE](LICENSE) file for full details.


## Written by

Pratham Makhni Alag (Autodesk Developer Network)<br />
http://www.autodesk.com/adn<br />


For troubleshooting, visit forums.autodesk.com and post with reference to the view and data api.
