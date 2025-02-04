module ModeloFuncional where

-- Funcao que Calcula o factorial de  um numero de forma recursiva(não possue recursão em calda
--uma vez que o resultado da chamada recursiva e multiplicado por n pra produzir o resultado final)
factorial :: Integer -> Integer
factorial 0 = 1 
factorial n = n*factorial(n - 1)

--CLASSE DE FUNÇÕES(fIRST CLASSE FUCTION), CLASSE DE TIPOS ONDE AS FUNÇÕES TAMBÉM SÃO TIPOS DE DADOS
-- Função recursiva que calcula o resto inteiro da divisão de dois numeros, utilizando subitração sucessiva
--Caso de teste: 15/4 = 3 e 15/7 = 1
restoDaDivisao :: Int -> Int -> Int
restoDaDivisao a b
         | b > a = a
         | b == a = 0
         | otherwise = restoDaDivisao (a-b) b

--Calcula a multiplicação de dois numeros usando somas de forma recursiva. 
multiplicacao :: Integer -> Integer -> Integer
multiplicacao a b 
        | a == 1 = b
        | otherwise = b + multiplicacao (a - 1) b

--Calculo do factorial utilizando recursão em calda(Economiza  recursos e aumanta a eficiencia)
fact :: Int -> Int -> Int
fact n valacumulado
        | n == 0 = valacumulado
        | n > 0 = fact (n - 1) (n*valacumulado)

--Calculo de potencia utilizando recursão em calda(economiza recursos e aumenta a eficiencia)
potencia1 :: Integer -> Integer -> Integer
potencia1 n valacumulado
      | n == 0 = valacumulado
      | n > 0 = potencia1 ( n - 1) (2*valacumulado)

--Calculo do enesimo numero da sequencia de Fibonance utilizando recusrsão em calda, com os gurdas, APLICOU-SE fUNÇÕES PURAS(os valores de retorno são determinados apenas pelos parametros deb entrada  sem efeitos colateras) e imutablidade
fibonance :: Int -> Int -> Int -> Int
fibonance n n1 n2
     | n == 0 = n1
     | n == 1 = n2
     | n > 1 = fibonance (n - 1) n1 (n1 + n2)

--Função que calcula a soma dos quadrados dos números de 1 a n,usando conceito de LIVENES
somaQuadrados n =  sum [x^2 | x <-[1..n]]

--Função que calcula a soma dos quadrados dos números de 1 a n,aplicando conceito de LIVENESS, com lista de compreensão, não ocupando espaço der memória comos elementos qu não forem usados na lista,permite que expressões sejam usadas somente quando necessárias
somaTermos num =  sum [x | x <-[1..num]]

--Função para calcular a soma dos cubos dos numeros de 1 a n

--Implementar funções puras.
--Implementar composição de funções
--Implementar Funções de alta ordem
--Implementar Funções Lambda e imutabilidade

--Funçõe anonimas (Expressões Lambda)
quadrado = \x->x*x
--divisoresDeDois n = let x = [1..n] in n`mod`2