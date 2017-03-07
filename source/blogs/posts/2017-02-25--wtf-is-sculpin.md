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

Sculpin is a static site generator written in PHP. And WTF is a static site genertor? It is a great tool for content that doesn’t need to be updated by multiple users on a regular basis, authentication, search, or any logic that requires server side communications. It can remove much of the complexity that comes with a CMS, as well as the need for server side technologies like PHP or a database server. Static site generator is great for my personal blog or the local astronomy group site, but not ideal from a large news organization that has much more dynamic content. Sculpin has the advantage of being written in a language I’m already familiar with; PHP. Some of the standout features of Sculpin include:

* Writing content in markdown
* TWIG templating
* Syntax highlighting
* Extremely fast
* Secure (everything is client side)
* Easily deployable (Can host static sites from github for free)

When designing my blog I was looking for the path of least resistance for sharing some code snippets and jotting down a few of my opinions to share with the Interwebs. For someone that is already familiar with PHP, Sculpin is the perfect tool to accomplish exactly this. How does one Sculpin?
``
## Installing Sculpin

1. Download the starter kit

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

## What's Happening?

Magic! Okay maybe not magic. Sculpin comes with an executable bin, that we're running to parse all of the Twig templates, html, and markdown sources it can find to generate static html pages.

`--watch` tells Sculpin to watch for file changes in order to rewrite necessary HTML files. `--server` launches PHP's built in web server which allows you to see your work in progress. The fact that I don't need a working web server to get started makes it even easier to skip to the part where I can begin writing content.

## Creating Content in Sculpin

Sculpin uses a markdown converter [michelf/php-markdown](https://github.com/michelf/php-markdown) for taking the blog content written in markdown and converting it to html. That means once the Twig templates and theme are in place, adding new content can be as simple as dropping a new markdown file into the code base. Luckily the starter kit comes with a working layout and theme, so we can get jump start to creating content.

By default Sculpin will look for blog post content or **source objects** in each file under the `/source' directory. All content posts can be written in markdown which Sculpin with convert into html.

```
 # Markdown Cheatsheet
 
 # This is an <h1>
 ## This is an <h2>
 ### This is an <h3>
 
 We can place special emphasis on some words by making them **bold** or *italics*
 
  Link
  [More on Markdown](https://guides.github.com/features/mastering-markdown/)
  
 Lists
 1. Step 1
 1. ????
 1. Step 3: Profit
 
 * Moon Knight
 * Scarlet Witch
 * Gambit
 * Hope Summers
```
 
 > # This is an &#60;h1&#62;
 > ## This is an &#60;h2&#62;
 > ### This is an &#60;h3&#62;
 >
 > We can place special emphasis on some words by making them **bold** or *italics*
 >
 > Link
 > [More on Markdown](https://guides.github.com/features/mastering-markdown/)
 
 > Lists
 >
 > 1. Step 1: Make numbered list
 > 1. Step 2: ????
 > 1. Step 3: Profit
 > 
 
* Moon Knight
* Scarlet Which
* Gambit
* Hope Summers

## Syntax Highlighting

Another key feature that is a necessity when writing about code is syntax highlighting. Sculpin ships with highlightjs. No assembly required, batteries included! 
```markdown
```php
use Drupal\Core\DrupalKernel;
use Symfony\Component\HttpFoundation\Request;

$autoloader = require_once 'autoload.php';

$kernel = new DrupalKernel('prod', $autoloader);

$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();

$kernel->terminate($request, $response);
`'`
```

```php
use Drupal\Core\DrupalKernel;
use Symfony\Component\HttpFoundation\Request;

$autoloader = require_once 'autoload.php';

$kernel = new DrupalKernel('prod', $autoloader);

$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();

$kernel->terminate($request, $response);
```

## YAML Frontmatter

Sculpin provides a method to provide additional information on how content can be formatted via a YAML formatter.

Markdown without YAML formatter.
```
 # Normal Markdown
```

With YAML formatter

```
---
title: WTF is Sculpin
date: 2017-03-31
layout: default
tags:
    - wtf is
    - sculpin
featured_image: 
    image: jackson.png
 ---
 # Markdown with spandex and a cape
```

The YAML formatters are seperated by `---` and written in YAML syntax. The YAML formatter will be parsed and injected into every page twig template using `page.%KEY%`. Nested structures are accessible by using a `.` to decend through the structure.

```html
we can access YAML directives with the TWIG template view {{ page.title}}
 
<img src="/assets/imgs/blogs/{{ page.featured_image.image }}"/>

```

They are a great way to provide meta information about the blog with in the markdown file. Information that can be used to do things like generate markup for something not easily supported in markdown, provide meta tag information, create taxonomy tagging of content, and more.

## Theming

Sculpin's theming system can be heavily customized, but for the most part does a great job of getting out of your way. It uses TWIG for it's templating engine, and relies on creating layouts, which are mostly just wrappers around page content.

```html
{% verbatim %}<!DOCTYPE html>
<html>
<head>
    {% include "head" %}
</head>
<body id="body">
    <div class="page-content">
        {% include "header" %}
        <main class="content" role="main">
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    {% block content_wrapper %}{% block content %}{% endblock %}{% endblock %}
                </div>
                <div class="col-md-2">
                    {% include "side_bar" %}
                </div>
            </div>
        </main>
        {% include "footer" %}
    </div>
    {% include "scripts" %}
</body>
</html>{% endverbatim %}
```

But that's a blog for another time.

## Conclusion

Sculpin does exactly what it sets out to do, and does it well. It's a great tool for someone already familiar with PHP, looking for a way to take TWIG templates, html, and markdown to create a static site that is easily deployable. While it can be extended by creating new bundles, it does not offer a lot in terms of managing dynamic content that requires server side interactions. It is a tool for a specific task, a task that it handles extremely well.

A huge thanks to [Beau D. Simensen](https://twitter.com/beausimensen) who created Sculpin, and being an all around awesome human being.