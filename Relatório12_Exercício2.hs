data Item = Item
  { nomeItem      :: String
  , categoriaItem :: String
  , precoItem     :: Double
  } deriving (Show)

data StatusCompra = Pendente | Concluida | Cancelada deriving (Show)

data Compra = Compra
  { itens        :: [Item]
  , statusCompra :: StatusCompra
  } deriving (Show)

totalItens :: [Item] -> Double
totalItens xs = sum (map precoItem xs)

valorFinal :: Compra -> Double
valorFinal compra
  | Cancelada <- statusCompra compra = 0.0
  | total > 200                      = total * 0.9
  | otherwise                        = total
  where
    total = totalItens (itens compra)

main :: IO ()
main = do
  let compra = Compra
        [ Item "Espada Mestra"   "Arma"       150.00
        , Item "Escudo Hyliano"  "Armadura"    80.00
        , Item "Poção de Vida"   "Consumível"  25.00
        , Item "Botas de Pégaso" "Equipamento" 60.00
        ]
        Concluida

  let compraCancelada = Compra
        [ Item "Arco Élfico" "Arma" 200.00
        , Item "Elixir Raro" "Item"  50.00
        ]
        Cancelada

  putStrLn "=== Lojas de Hyrule ==="
  putStrLn $ "\n[Compra 1 - Status: " ++ show (statusCompra compra) ++ "]"
  putStrLn $ "Total bruto: R$ " ++ show (totalItens (itens compra))
  putStrLn $ "Valor final: R$ " ++ show (valorFinal compra)
  putStrLn $ "\n[Compra 2 - Status: " ++ show (statusCompra compraCancelada) ++ "]"
  putStrLn $ "Total bruto: R$ " ++ show (totalItens (itens compraCancelada))
  putStrLn $ "Valor final: R$ " ++ show (valorFinal compraCancelada)
