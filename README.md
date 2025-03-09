# [Audio|E]book piracy server

I made this for a friend, but I suppose other people could use it.
I would not suggest doing so, since many options have been hardcoded to simplify the process.

Designed for a clean Ubuntu Server install.

## How to use

1. clone this repo
2. run ./install.sh
3. edit the following files:
   - .env
   - appdata/homepage/services.yaml
   - something else i'm likely forgetting
4. run `mkdtool reload`
5. configure all your new apps
6. forward port `8096` and have fun!