import MissingH.Cmd
import System.Environment
import MissingH.Str

refs :: [String] -> [(Int, String)]
refs inp =
    let stripped = map strip inp
        refpart = dropWhile ((/=) "References") stripped
        

main = 
    do args <- getArgs
    (ph, c) <- pipeLinesFrom "lynx" [head args]
    let inp = map rstrip c
    refs = getRefsFrom inp
    reformat inp refs
