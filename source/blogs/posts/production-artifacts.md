---
title: Production Artifacts
date: 2016-03-17
tags:
    - devops
    - automated workflow

---
For all of Drupal 6's lifespan and most Drupal 7's a typical project would like similar to this:

    - includes/
    - misc/
    - modules/
    - profiles/
    - scripts/
    - sites/
    - themes/
    - CHANGELOG.txt
    - COPYRIGHT.txt
    - index.php
    - INSTALL.mysql.txt
    - INSTALL.pgsql.txt
    - install.php
    - INSTALL.sqlite.txt
    - INSTALL.txt
    - LICENSE.txt
    - MAINTAINERS.txt
    - README.txt
    - UPGRADE.txt
    - authorize.php
    - cron.php
    - index.php
    - README.txt
    - robots.txt
    - update.php
    - UPGRADE.txt
    - web.config
    - xmlrpc.php
   
There has been a strong push the last few years to ["get off the island"](http://www.garfieldtech.com/blog/off-the-island-2013) and have more synergy with other PHP projects. With these efforts Drupal has seen more and more 3rd party tools to enhance the development process of building a site. Tools like build scripts, Behat, composer, vagrant are becoming more and more common while developing a Drupal site. A Drupal 7 project that includes some of these tools might look closer to this:

    - bin/ - executables added from composer e.g. Behat
    - build/ - build scripts
    - cnf/ - project specific configuration
    - docs/ - project documentation
    - features/ - Behat tests
    - modules/ - Drupal custom features and modules
    - tests/ - catch all for unit tests, accessibility tests, or simple tests
    - themes/ - Drupal custom theme
    - vendor/ - 3rd party libraries added by composer
    - www/ - Drupal docroot.
    - .travis.yml - CI server config file
    - behat.yml - Behat test suite config file
    - Vagrantfile - Virtualization config file
    - composer.json - dependency management file
  
#### The Benefits

At the end of the day the code in the project repo should be supportive of development. Code deployed to production should be the product being built. The project repo should include all of the tools, and code the team actively developing the project needs to successfully write code, and the Drupal docroot is not part of that. The Drupal docroot is something that can be assembled from dependencies using a build process and deployed to the client servers as a production artifact. Think of the Drupal docroot as compiled code, like an executable jar file, or how sass compiles into CSS. 

Projects should be structured to support development and the final product should be the only thing that is delivered to production for the client.

#### The Challenges 

Some web hosts have their own opinions on git projects roots should be setup. Pantheon uses the Drupal root as the project root, while acquia places drupal within a `drupalroot` directory.

    # Pantheon
    
    - includes/
    - misc/
    - modules/
    - profiles/
    - scripts/
    - sites/
    - themes/
    - CHANGELOG.txt
    - COPYRIGHT.txt
    - index.php
    - INSTALL.mysql.txt
    - INSTALL.pgsql.txt
    - install.php
    - INSTALL.sqlite.txt
    - INSTALL.txt
    - LICENSE.txt
    - MAINTAINERS.txt
    - README.txt
    - UPGRADE.txt
    - authorize.php
    - cron.php
    - index.php
    - README.txt
    - robots.txt
    - update.php
    - UPGRADE.txt
    - web.config
    - xmlrpc.php

    # Acquia
    
    - acquia-utils/
    - docroot/
    - README.acquia
    


----
### Internal Notes
**When the reader finishes reading my post, what will they have gained? The answer should involve saved time and/or new ideas generated for the reader.**

Rethink how git repos are organized and code is deployed.

**What makes my content different than the thousands of other posts out there solving similar problems? Is it easier to just point to someone else’s post? Sometimes, all you need is a link to another post with some context added in.**

...Not sure, haven't researched this topic heavily within the context of Drupal.

### Problems production artifacts solve

* Prevents dev tools from being deployed to production environments
* Allows introduction of development tooling while still supporting hosting with opinionated hosts (Acquia and Pantheon)
* You should have a build process (composer, drush make, bash, phping, etc) to put Drupal into a known state
  * Keeps production settings separate from development settings
* Allows code repos to be structured to support development workflow (across multiple projects) rather than be dictated by host environment

### Old Intro

Behat, devops, automated testing, and BDD (behavior driven development) are all part of a movement within the Drupal community that is gaining momentum as clients and agencies start to realize the benefits these can have on this can have on the quality of their product. Tests are most effective when the software they are testing can be placed into a known state. In a workflow where dependencies are defined (composer) it's no longer a requirement to place the drupal root, and contrib projects into version control. With contrib projects managed with composer and build scripts tracked in version control we don't need to have Drupal or contrib projects committed in the repositories.
 
If there are tons of new code in the repo and the Drupal docroot is no longer part of the repo, how does the Drupal site get deployed to production servers? 