module Bob exposing (..)

hey : String -> String
hey tellBob =
    if tellBob == String.toUpper tellBob && String.endsWith "!" tellBob then
        "Whoa, chill out!"
    else if String.endsWith "?" tellBob then
        "Sure."
    else
        "Whatever."
