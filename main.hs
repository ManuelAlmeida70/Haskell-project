-- Método 1: Usando System.Process para chamar o SWI-Prolog
import System.Process
import System.IO

-- Função para consultar Prolog
queryProlog :: String -> IO String
queryProlog query = do
    (_, Just hout, _, _) <- createProcess (proc "swipl" ["-q", "-t", "halt", "-g", query])
        { std_out = CreatePipe }
    output <- hGetContents hout
    return output

-- Exemplo de uso
main :: IO ()
main = do
    result <- queryProlog "consult('prolog.pl'), homem(X), write(X), nl, fail"
    putStrLn result