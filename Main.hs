-- Método 1: Usando System.Process para chamar o SWI-Prolog
import ModeloFuncional
import System.Process
import System.IO

-- Função para consultar Prolog
queryProlog :: String -> IO String
queryProlog query = do
    (_, Just hout, _, _) <- createProcess (proc "swipl" ["-q", "-t", "halt", "-g", query])
        { std_out = CreatePipe }
    output <- hGetContents hout
    return output

-- Função para exibir o menu principal
menuPrincipal :: IO ()
menuPrincipal = do
  putStrLn "\n--- Menu de Funções ---"
  putStrLn "1. Calcular Fatorial"
  putStrLn "2. Resto da Divisão"
  putStrLn "3. Multiplicação Recursiva"
  putStrLn "4. Fatorial com Recursão de Cauda"
  putStrLn "5. Potência com Recursão de Cauda"
  putStrLn "6. Fibonacci"
  putStrLn "7. Soma dos Quadrados"
  putStrLn "8. Soma dos Termos"
  putStrLn "9. Quadrado de um Número"
  putStrLn "0. Sair"
  putStrLn "Escolha uma opção:"
  
  opcao <- getLine
  case opcao of
    "1" -> do
      putStrLn "Digite um número para calcular o fatorial:"
      n <- readLn
      putStrLn $ "Fatorial de " ++ show n ++ ": " ++ show (factorial n)
      menuPrincipal
    
    "2" -> do
      putStrLn "Digite o primeiro número:"
      a <- readLn
      putStrLn "Digite o segundo número:"
      b <- readLn
      putStrLn $ "Resto da divisão de " ++ show a ++ " por " ++ show b ++ ": " ++ show (restoDaDivisao a b)
      menuPrincipal
    
    "3" -> do
      putStrLn "Digite o primeiro número:"
      a <- readLn
      putStrLn "Digite o segundo número:"
      b <- readLn
      putStrLn $ "Multiplicação de " ++ show a ++ " por " ++ show b ++ ": " ++ show (multiplicacao a b)
      menuPrincipal
    
    "4" -> do
      putStrLn "Digite um número para calcular o fatorial com recursão de cauda:"
      n <- readLn
      putStrLn $ "Fatorial de " ++ show n ++ ": " ++ show (fact n 1)
      menuPrincipal
    
    "5" -> do
      putStrLn "Digite o expoente:"
      n <- readLn
      putStrLn $ "Potência de 2^" ++ show n ++ ": " ++ show (potencia1 n 1)
      menuPrincipal
    
    "6" -> do
      putStrLn "Digite a posição na sequência de Fibonacci:"
      n <- readLn
      putStrLn $ "Fibonacci na posição " ++ show n ++ ": " ++ show (fibonance n 0 1)
      menuPrincipal
    
    "7" -> do
      putStrLn "Digite um número para calcular a soma dos quadrados:"
      n <- readLn
      putStrLn $ "Soma dos quadrados até " ++ show n ++ ": " ++ show (somaQuadrados n)
      menuPrincipal
    
    "8" -> do
      putStrLn "Digite um número para calcular a soma dos termos:"
      n <- readLn
      putStrLn $ "Soma dos termos até " ++ show n ++ ": " ++ show (somaTermos n)
      menuPrincipal
    
    "9" -> do
      putStrLn "Digite um número para calcular seu quadrado:"
      x <- readLn
      putStrLn $ "Quadrado de " ++ show x ++ ": " ++ show (quadrado x)
      menuPrincipal
    
    "0" -> putStrLn "Encerrando o programa..."
    
    _ -> do
      putStrLn "Opção inválida. Tente novamente."
      menuPrincipal

-- Exemplo de uso
main :: IO ()
main = do
    {-
    result <- queryProlog "consult('prolog.pl'), homem(X), write(X), nl, fail"
    putStrLn result
    -}
    menuPrincipal
