data Bebida = Bebida
  { nomeBebida :: String
  , tipoBebida :: String
  , precoBebida :: Double
  } deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show)

data Pedido = Pedido
  { bebidas :: [Bebida]
  , statusPedido :: StatusPedido
  } deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
  | Cancelado <- statusPedido pedido = 0.0
  | otherwise = sum (map precoBebida (bebidas pedido))

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)    = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nomeBebida b

main :: IO ()
main = do
  let pedido1 = Pedido
        [ Bebida "Café Expresso" "Quente" 8.50
        , Bebida "Croissant de Amêndoas" "Sólido" 12.00
        , Bebida "Suco de Laranja" "Frio" 9.00
        ]
        Entregue

  let pedido2 = Pedido
        [ Bebida "Chá Verde" "Quente" 7.00
        , Bebida "Bolo de Chocolate" "Sólido" 15.00
        ]
        Cancelado

  putStrLn "=== Café Leblanc ==="
  putStrLn $ "\n[Pedido 1 - Status: " ++ show (statusPedido pedido1) ++ "]"
  putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido1
  putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido1)
  putStrLn $ "\n[Pedido 2 - Status: " ++ show (statusPedido pedido2) ++ "]"
  putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido2
  putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido2)
