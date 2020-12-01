# Homebrew Phalcon

## Currently expects PHP 7.4 or higher

$ `brew tap phalcon/extension https://github.com/phalcon/homebrew-tap`

## Phalcon 4.1.0

This will also install php-psr 1.0.0 from https://github.com/jbboehr/php-psr as a dependency

$ `brew install phalcon`

### Previous Versions

**4.0.6** -> $ `brew install phalcon@4.0.6`

**4.0.5** -> $ `brew install phalcon@4.0.5` Updated PSR 1.0.0

**4.0.4** -> $ `brew install phalcon@4.0.4` Last version using PSR 0.7.0

**4.0.3** -> $ `brew install phalcon@4.0.3`

**4.0.2** -> $ `brew install phalcon@4.0.2` 

**4.0.0** -> $ `brew install phalcon@4.0.0`

**4.0.0rc2** -> $ `brew install phalcon@4.0rc2`

**4.0.0rc3** -> $ `brew install phalcon@4.0rc3`

## Phalcon 3.4

$ `brew install phalcon@3.4` -> This binds against PHP 7.3

### Use your Own PHP

If you don't wanna use the homebrew php version

    Note: its usually good to use `-v` flag with `install` for debugging these kinds of installs 

$ `brew install phalcon --without-homebrew-php`

# Attribution

This is specifically based upon homebrew php on https://github.com/Homebrew/homebrew-php/tree/86079979812fd9d154f5363c0effde5de2558141 and modified to support phalcon specifically
