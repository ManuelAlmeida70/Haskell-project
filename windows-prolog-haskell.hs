import System.Process
import System.IO
import System.Directory (findExecutable)
import Control.Exception (handle, SomeException)

-- Função para encontrar o caminho do SWI-Prolog
findSwipl :: IO (Maybe FilePath)
findSwipl = findExecutable "swipl.exe"

-- Função para consultar Prolog com tratamento de erro
queryProlog :: String -> IO (Either String String)
queryProlog query = handle handleError $ do
    maybePath <- findSwipl
    case maybePath of
        Nothing -> return $ Left "SWI-Prolog não encontrado. Verifique se está instalado e no PATH"
        Just swiplPath -> do
            (_, Just hout, Just herr, ph) <- createProcess (proc swiplPath ["-q", "-t", "halt", "-g", query])
                { std_out = CreatePipe
                , std_err = CreatePipe }
            output <- hGetContents hout
            errors <- hGetContents herr
            exitCode <- waitForProcess ph
            case exitCode of
                ExitSuccess -> return $ Right output
                ExitFailure _ -> return $ Left $ "Erro ao executar consulta: " ++ errors
  where
    handleError :: SomeException -> IO (Either String String)
    handleError e = return $ Left $ "Erro: " ++ show e

-- Exemplo de uso
main :: IO ()
main = do
    result <- queryProlog "consult('prolog01.pl'), homem(X), write(X), nl, fail"
    case result of
        Left err -> putStrLn $ "Erro: " ++ err
        Right output -> putStrLn output
