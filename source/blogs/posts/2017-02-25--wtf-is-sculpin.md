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

Magic! Okay maybe not magic. Sculpin is parsing all of the Twig templates, html, and markdown it finds to generate static html pages. It creates *static* html pages for each page of the website. 

The `--watch` simply tells Sculpin to watch for any file changes in order to rewrite any necessary HTML files. The `--server` launches PHP's built in web server which allows you to see your work in progress.

## Creating Content in Sculpin

Sculpin uses a markdown parser (michelf/php-markdown) for taking the blog content written in markdown and converting it to html. That means once the Twig templates and theme is in place, new content can be as simple as dropping a new markdown file into the code base.

By default Sculpin will look for blog content or **source objects** in each file under the `/source' directory.

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
 * Scarlet Which
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
* Hope Summers

### Syntax Highlighting

Another key feature that is a necessity when writing about code is syntax highlighting. Sculpin ships with highlightjs. No assembly required, batteries included! 
```markdown
```php
function fancyPants($arg) {
  if($arg) {
    return new Response($arg)
  }
}
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

### YAML Frontmatter

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
draft: true
tags:
    - wtf is
    - sculpin
featured_image: 
    image: jackson.png
 ---
 # Markdown with spandex and a cape
```

The YAML formatters are seperated by `---` and written in YAML. The YAML formatter will be parsed and injected into every page template using `page.%key%`. Nested structures are accessible by using a `.` to decend through the structure.

```html
we can access YAML directives with the TWIG template view {{ page.title}}
 
<img src="/assets/imgs/blogs/{{ page.featured_image.image }}"/>

```


## Theming

Sculpin's theming system can be heavily customized, but for the most part does a great job of gettings out of your way. It uses TWIG for it's templating engine, and relies on creating layouts, which are mostly just wrappers around page content.

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

Sculpin does exactly what it sets out to do, and does it well. It's a great tool for someone already familiar with PHP looking for a way to take twig templates, html, and markdown to create a static site that easily deployable. While it can be extended by creating new bundles, it does not offer a lot of in terms of managing dynamic content that requires server side interactions. It is a tool for a specific task, a task that it handles extremely well.

A huge thanks to [Beau D. Simensen](https://twitter.com/beausimensen) who created Sculpin, and being an all around awesome human being.