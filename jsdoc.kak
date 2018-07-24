def jsdoc %{
    try %{
        # start writing the doc
        exec -draft 'O/**<ret> *<esc>'
        try %{
            # selects all the parameters
            exec 'ghf(m'

            # split every parameters
            exec 's\w+<ret>'

            # write the doc for every single parameter
            exec -draft -itersel '"ayO* @param {type} |<esc>h"aR'

            # remove multi selection
            exec '<space>'
        } catch %{
            echo "jsdoc Error: couldn't parse function declaration"
        }
        exec 'O* @returns {type}<ret>*/<esc>'

        # align doc comment with function.
        # selects the jsdoc comment and the first line of the function
        # and applies the indentation to the selection.
        exec '<a-/>/\*\*<ret>?\*/<ret>J<a-s><a-&><space>'
    } catch %{
        echo "jsdoc Error: no function declaration found"
    }
}
