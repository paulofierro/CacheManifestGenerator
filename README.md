# CacheManifestGenerator

When creating a web app that is going to use the HTML5 app cache it can be painstaking to create the cache manifest file by hand. Not finding any tools that would do this as I wanted, I put together this simple script in Ruby that traverses any folder recursively and makes a note of each file. You can add specific files to be ignored and the specific file extensions to look for.

It also adds a comment with the time of creation. This is enough to trigger browsers to check the manifest contents as the file itself is different.

## Output file extension

The proposed extension for manifest files is `.appcacheAnd`. However I found that iOS3 devices would ignore these files, so for [fotb.me](http://fotb.me) we used the `.manifest` extension. The file extension doesn't really matter as long as you are serving it up using the correct MIME type.

## MIME types and `.htaccess`

Manifests must be served using the `text/cache-manifest` MIME type. For Apache, simply add this to your `.htaccess` or config file:

	AddType text/cache-manifest .appcache

To avoid expiry issues that may lead to insanity I suggest checking out the `htaccessSample` file.

## Sample usage
	<!DOCTYPE html>
	&lt;html manifest="/path/to/manifest/myManifest.appcache"&gt;
	&lt;head&gt;
	&lt;meta charset="utf-8" /&gt;
	&lt;title&gt;Sexy title&lt;/title&gt;
	&lt;/head&gt;
	&lt;body&gt;
		Hi, I'm using a manifest and shit!
	&lt;/body&gt;
	&lt;/html&gt;

## Further reading

[Dive into HTML5 - Offline Web Applications](http://diveintohtml5.org/offline.html)

[HTML5 Rocks - A Beginner's Guide to Using the Application Cache](http://www.html5rocks.com/en/tutorials/appcache/beginner/)

[HTML5 Doctor - Go offline with application cache](http://html5doctor.com/go-offline-with-application-cache/)

[W3C - Offline Web Applications](http://www.w3.org/TR/offline-webapps/)