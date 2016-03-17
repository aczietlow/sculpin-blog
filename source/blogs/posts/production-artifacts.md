---
title: Production artifacts
date: 2016-03-17
tags:
    - devops
    - automated workflow

---
Behat, automation, automated testing, and BDD (behavior driven development) are all part of a movement within the Drupal community that is gaining momentum as clients and teams start to realize the benefits these can have on their product. Having a explicit, repeatable build process if one of the pillars of having a successful automated testing and deployment workflow. In a workflow where dependencies are defined, possibly with composer or drush make files, its no longer a requirement to place the drupal root, and contrib projects into version control. Adding in all of the tools for testing, development, and building along with removing the drupal project and contrib projects from git project root starts to radically restructure what a project root will look like. This approach brings many benefits such as automated tests, more reliable test results from testing Drupal in a known state, ease of local development but comes with a unique challenge. If there are tons of new code in the repo and the Drupal docroot is no longer part of the repo, what gets deployed to the production servers, and how is are deployments accomplished.

    # A traditional Drupal 7 project root

    - includes/
    - misc/
    - modules/
    - profiles/
    - scripts/
    - sites/
    - themes/
    - index.php
    - ...
    - .git/
<br>
    # A Drupal 7 project root configured for testing and automation
    
    - bin/ - executables added from composer e.g. Behat
    - build/ - build scripts
    - cnf/ - project specific configuration
    - docs/ - project documentation
    - features/ - Behat tests
    - modules/ - Drupal custom features and modules
    - tests/ - catch all for unit tests, accessibility tests, or simple tests
    - themes/ - Drupal custom theme
    - vendor/ - 3rd party libraries added by composer
    - .git/ - git directory
    - .travis.yml - CI server config file
    - behat.yml - Behat test suite config file
    - Vagrantfile - Virtual box config file
    - composer.json - dependency management file

#### The benefits

I feel at the end of the day the code in the project repo should be supportive of development. It should include all of the tools, and code the team actively developing the project needs to successfully write code, and the drupal docroot is not part of that. The Drupal docroot is something that can be assembled from dependencies and deployed to the client servers as a production artifact. Think of the Drupal docroot as compiled code, like an executable jar file.

An explicit build process in Drupal means defining what the project dependencies are (modules, themes, libraries, etc) and having a process to build Drupal in some known state. 

#### The challenges 

...

----
### Internal Notes
**When the reader finishes reading my post, what will they have gained? The answer should involve saved time and/or new ideas generated for the reader.**

Better grasp on understanding closures and anonymous functions.

**What makes my content different than the thousands of other posts out there solving similar problems? Is it easier to just point to someone else’s post? Sometimes, all you need is a link to another post with some context added in.**

I’m going to provide more details and numerous examples, as well as go into further details about how closures are likely to be used in modern php application development.