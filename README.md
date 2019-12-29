# Homebrew Phalcon

## Currently expects PHP 7.4 or higher

$ `brew tap phalcon/extension https://github.com/phalcon/homebrew-tap`

## Phalcon 3.4

$ `brew install phalcon@3.4` -> This binds against PHP 7.3

## Phalcon 4.0.0

This will also install php-psr 0.7.0 from https://github.com/jbboehr/php-psr as a dependency

$ `brew install phalcon`

### Use your Own PHP

If you don't wanna use the homebrew php version

    Note: its usually good to use `-v` flag with `install` for debugging these kinds of installs 

$ `brew install phalcon --without-homebrew-php`

# Attribution

This is specifically based upon homebrew php on https://github.com/Homebrew/homebrew-php/tree/86079979812fd9d154f5363c0effde5de2558141 and modified to support phalcon specifically
