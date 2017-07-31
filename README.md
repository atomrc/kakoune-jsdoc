# Kakoune JSDoc generator

Helps you generate JSDoc from [kakoune](http://kakoune.org)

![jsdoc generator demo](/screenshots/demo.gif)

# Install

Copy the `jsdoc.kak` file in your `~/.config/kak/autoload/` folder.

It will add the `jsdoc` function when a `javascript` file is detected

# Generate JSDoc

To generate jsdoc, put the cursor in a line containing a function declaration, then run

    :jsdoc
    
It will parses the function's declaration and extract the name and parameters of the function

You could also add a shortcut to generate doc quickly

    hook global WinSetOption filetype=javascript %{
      map global user d ':jsdoc<ret>' -docstring "Generate jsdoc"
    }

# Limitation

- it only works for function declaration 
- it's having some hard times with destructured objects as function parameters
