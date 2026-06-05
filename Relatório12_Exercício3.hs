data Banda = Banda
  { nomeBanda   :: String
  , generoBanda :: String
  , cacheBanda  :: Double
  } deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show)

data Evento = Evento
  { bandas       :: [Banda]
  , statusEvento :: StatusEvento
  } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
  | Cancelado <- statusEvento evento = 0.0
  | otherwise                        = totalCache * 1.2
  where
    totalCache = sum (map cacheBanda (bandas evento))

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _)    = "Nenhuma banda escalada para abertura."
bandaAbertura (Evento (b:_) _) = nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda escalada para encerramento."
bandaEncerramento (Evento bs _) = nomeBanda (last bs)

main :: IO ()
main = do
  let eventoAtivo = Evento
        [ Banda "The Phantom Thieves" "J-Rock"       5000.00
        , Banda "Velvet Room Strings" "Orquestra"    8000.00
        , Banda "Igor & The Shadows"  "Experimental" 3500.00
        ]
        Ativo

  let eventoEncerrado = Evento
        [ Banda "Midnight Raven" "Gothic Metal" 4500.00
        , Banda "Sunny Side Up"  "Pop"          6000.00
        ]
        Encerrado

  let eventoCancelado = Evento
        [ Banda "The Wildcards" "Punk" 2000.00 ]
        Cancelado

  putStrLn "=== Casa de Shows ==="
  mapM_ (\ev -> do
    putStrLn $ "\n[Evento - Status: " ++ show (statusEvento ev) ++ "]"
    putStrLn $ "Banda de abertura: "     ++ bandaAbertura ev
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento ev
    putStrLn $ "Custo total: R$ "        ++ show (custoTotalEvento ev)
    ) [eventoAtivo, eventoEncerrado, eventoCancelado]
