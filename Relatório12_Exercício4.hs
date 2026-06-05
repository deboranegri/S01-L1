data Servico = Servico
  { nomeServico  :: String
  , tipoServico  :: String
  , precoServico :: Double
  } deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show)

data Atendimento = Atendimento
  { servicos           :: [Servico]
  , statusAtendimento  :: StatusAtendimento
  } deriving (Show)

totalServicos :: [Servico] -> Double
totalServicos xs = sum (map precoServico xs)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
  | Cancelado <- statusAtendimento atendimento = 0.0
  | length (servicos atendimento) > 3          = total * 1.25
  | otherwise                                  = total
  where
    total = totalServicos (servicos atendimento)

primeiroServico :: Atendimento -> String
primeiroServico (Atendimento [] _)    = "Nenhum serviço contratado."
primeiroServico (Atendimento (s:_) _) = nomeServico s

main :: IO ()
main = do
  let atendimento1 = Atendimento
        [ Servico "Banho Medicinal"       "Terapêutico" 120.00
        , Servico "Massagem com Ervas"    "Relaxante"    95.00
        , Servico "Esfoliação de Lama"    "Estético"     80.00
        , Servico "Imersão em Vapores"    "Purificador"  60.00
        , Servico "Ritual de Purificação" "Espiritual"  110.00
        ]
        Finalizado

  let atendimento2 = Atendimento
        [ Servico "Banho Rápido"      "Básico" 40.00
        , Servico "Enxágue com Ervas" "Básico" 30.00
        ]
        Cancelado

  putStrLn "=== Casa de Banhos da Yubaba ==="
  putStrLn $ "\n[Atendimento 1 - Status: " ++ show (statusAtendimento atendimento1) ++ "]"
  putStrLn $ "Primeiro serviço: " ++ primeiroServico atendimento1
  putStrLn $ "Total bruto: R$ "   ++ show (totalServicos (servicos atendimento1))
  putStrLn $ "Valor final: R$ "   ++ show (valorFinalAtendimento atendimento1)
  putStrLn $ "\n[Atendimento 2 - Status: " ++ show (statusAtendimento atendimento2) ++ "]"
  putStrLn $ "Primeiro serviço: " ++ primeiroServico atendimento2
  putStrLn $ "Total bruto: R$ "   ++ show (totalServicos (servicos atendimento2))
  putStrLn $ "Valor final: R$ "   ++ show (valorFinalAtendimento atendimento2)
