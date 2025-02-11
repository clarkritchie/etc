# Dev Containers

A basic example of how to setup Dev Containers based off Microsoft's Python 3.12 image.  This [YouTube video](https://www.youtube.com/watch?v=b1RavPr_878) is also a great place to start.

1. Install the VS Code plugin for Dev Containers.
2. At the root of your project, `mkdir .devcontainer` and inside of that, make a [devcontainer.json](devcontainer.json) file.  Make note of the path for `dockerComposeFile` -- you can put this anywhere, really, even in `.devcontainer` would be fine -- I just happen to to keep mine up one directory.
3. Make a directory at the path defined by `dockerComposeFile` and within that, place a [Dockerfile](Dockerfile.dev-container), a [compose config](docker-compose-dev-container.yaml) and a basic [entrypoint](entrypoint-dev-container.sh) script.  Customize these, as required!  The compose config is pretty much just regular Docker Compose.  You can also name these files however you wish.
4. Restart VS Code and it should prompt you to re-open your project in a container.  Do this.  You'll know it succeeded if your VS Code terminal prompt is `/workspace` instead of your normal `/Users/cool-guy/projects` or whatever.

Mac OS users -- If you are mounting your ssh keys in your container, you might want to add `IgnoreUnknown UseKeychain` to your `~/.ssh/config` since the container is Linux.
