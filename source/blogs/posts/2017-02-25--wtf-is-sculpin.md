---
title: WTF is ... Sculpin
date: 2017-02-25
draft: true
tags:
    - wtf is
    - sculpin
featured_image: 
    image: jackson.png
    alt: Meet Jackson, the Sculpin mascot 
---

Sculpin is a PHP based static site generator. And WTF are static site genertors? They are great for content that doesn’t need to be updated by multiple users on a regular basis i.e. a static website. They can remove much of the complexity that comes with a CMS as well as a need for server side technologies like PHP or a datbase server. It’s great for my personal blog, but not ideal from a large news organization that has much more dynamic content. Sculpin also has the advantage of being written in a language I’m already familiar with. Some of the standout features of Sculpin include:
* Writing content on markdown
* Twig based templating
* Syntax highlighting
* Extremely fast
* Secure (everything is client side)
* Can host static sites from github

I was looking for the path of least resistance for sharing some code snippets or jotting down a few of my opinions. For someone that is already familiar with PHP Sculpin is the perfect tool to accomplish this.

## Installing Sculpin

1. Download the Starterkit

```
git clone https://github.com/sculpin/sculpin-blog-skeleton.git myblog
cd myblog
composer install
```

The starter kit is a skeleton build of Sculpin and is a great starting point for launching Sculpin as a blog.

2. Run Sculpin


```
vendor/sculpin/sculpin/bin/sculpin generate --watch --server
```

Navigate to http://localhost:8000. BAM! You now have a boiler plate Sculpin site.

## What's happening?

Magic! Okay maybe not magic. Sculpin is generating html from the TWIG templates it finds, parsing any markdown content that it is aware of, converts it to html, and injects the html into the templates. It creates *static* html pages for each page of the website. 

The `--watch` simply tells Sculpin to watch for any file changes in order to rewrite any necessary HTML files. The `--server` launches PHP's built in web server which allows you to see your work in progress.

## Creating Content in Sculpin

Sculpin 