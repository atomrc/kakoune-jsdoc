def jsdoc %{
    # select the whole line (a better pattern might be to
    # select until the first opening { //}
    exec 'x'
    try %{
        # select the function's name
        exec 's(?<=function )\s*\w+'

        # seems to be a bug, I cannot add the <ret> in the previous exec, it pops a parsing error
        exec '<ret>'

        # copy function's name to register a
        exec '"ay'

        # start writing the doc and add the function's name
        exec -draft -itersel 'O/**<ret> * |<esc>"aR'
        try %{
            # again, select the whole line
            exec 'x'

            # split every parameters
            exec 's\w+(?=[,)])<ret>'

            # write the doc for every single parameter
            exec -draft -itersel '"ayO* @param {type} |<esc>"aR'

            # remove multi selection
            exec '<space>'
        } catch %{
            echo "jsdoc Error: couldn't parse function declaration"
        }
        exec 'O* @return {type}<ret>*/<esc>'
    } catch %{
        echo "jsdoc Error: no function declaration found"
    }
}
