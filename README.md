# ONEm Framework Documentation

The purpose of this repo is to provide a reference point for the entire ONEm Framework documentation set for consumption by 3rd party developers.  This includes:

* Guides and intros
* API Reference documentation
* SDK documentation
* Any other relevant documents

The documents are written in Markdown using Mkdocs.

## Installation

1. Create a virtual environment and activate it.
2. Clone and cd into this repo
3. `pip install -r requirements.txt`

## Configuration

See the `mkdocs.yml` in the project's root directory and the [mkdocs documentation](https://www.mkdocs.org).

The documents contain template data such as external links to the API Reference and Developer Portal.  Since these links vary between production, staging and POC, they can be controlled via the `mkdocs.yml` configuration file using the `extra:` parameter:

```
extra:
  links:
    portal: https://developer-portal-poc.onem.zone/
    api: https://developer-api-poc.onem.zone/docs
```

## Running on localhost

```bash
// create ".env" file based on "example.env" file
// the example file contains the staging env vars
$ cp example.env .env

// start the doc server with env vars loaded
$ eval $(egrep -v '^#' .env | xargs) mkdocs serve
```

## Running via npm

Uses node [serve-static](https://www.npmjs.com/package/serve-static)

```
$ npm run start
```

## Building

The following command re-generates the html files in the /site directory for production use.
```
$ mkdocs build
```
