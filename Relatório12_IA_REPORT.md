Identifição: Débora de Farias Negri Matrícula: 768

Modelo utilizado: Claude Sonnet 4.6 (claude.ai)

Exercício 1 (Café Leblanc)
Prompt enviado:

Estou fazendo um exercício de Haskell e tenho dúvidas sobre como criar tipos de dados com campos nomeados. O exercício pede para definir um tipo Bebida com os campos nome, tipo e preco, um tipo StatusPedido com os construtores Aberto, Entregue e Cancelado, e um tipo Pedido com uma lista de bebidas e um StatusPedido. Também preciso implementar a função valorTotalPedido :: Pedido -> Double usando guards, retornando 0.0 se o pedido estiver Cancelado e o total simples nos demais casos. E a função primeiraBebida :: Pedido -> String usando pattern matching. Preciso que me ajude.

Resposta: Claro! Em Haskell, tipos com campos nomeados são criados usando record syntax. Veja como ficaria:
data Bebida = Bebida
  { nomeBebida  :: String
  , tipoBebida  :: String
  , precoBebida :: Double
  } deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show)

data Pedido = Pedido
  { bebidas      :: [Bebida]
  , statusPedido :: StatusPedido
  } deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
  | Cancelado <- statusPedido pedido = 0.0
  | otherwise = sum (map precoBebida (bebidas pedido))

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)    = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nomeBebida b

Prompt 2 – Dúvida sobre guards com tipos algébricos
Prompt enviado:

Na função valorTotalPedido, você usou | Cancelado <- statusPedido pedido. Por que esse padrão com <- dentro do guard? Eu poderia usar statusPedido pedido == Cancelado no lugar?

Resposta:

Ótima pergunta! Sim, você pode usar == normalmente, mas para isso o tipo precisaria derivar Eq:

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show, Eq)

E então:

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
  | statusPedido pedido == Cancelado = 0.0
  | otherwise = sum (map precoBebida (bebidas pedido))
  
O padrão | Cancelado <- statusPedido pedido é chamado de pattern guard – ele faz um pattern matching dentro do guard sem necessidade de derivar Eq. Ambas as formas são válidas; a com == é mais legível para iniciantes; a com pattern guard é mais idiomática em Haskell avançado.

Prompt 3 – Exercício 2 (Lojas de Hyrule)
Prompt enviado:

Agora preciso resolver o Exercício 2. Devo criar os tipos Item (nome, categoria, preco), StatusCompra (Pendente, Concluida, Cancelada) e Compra (lista de itens e status). Preciso implementar totalItens :: [Item] -> Double usando map e sum, e valorFinal :: Compra -> Double com guards: 0.0 se Cancelada, 10% de desconto se o total passar de 200, e o total simples nos demais casos. Como usar map e sum juntos?

Resposta:

O map aplica uma função a cada elemento de uma lista, e sum soma todos os elementos. Combinados:

totalItens :: [Item] -> Double
totalItens xs = sum (map precoItem xs)

Isso é equivalente a percorrer cada Item da lista, extrair o precoItem, e somar tudo. Para valorFinal:

valorFinal :: Compra -> Double
valorFinal compra
  | Cancelada <- statusCompra compra = 0.0
  | total > 200                      = total * 0.9
  | otherwise                        = total
  where
    total = totalItens (itens compra)

O bloco where é muito útil para não recalcular totalItens em cada ramo do guard. O valor total é calculado uma vez e reaproveitado.

Prompt 4 – Exercício 3 (Casa de Shows)
Prompt enviado:

Para o Exercício 3, preciso implementar bandaEncerramento :: Evento -> String que retorna o nome da última banda usando last. Como usar last com segurança numa lista que pode estar vazia?

Resposta:

A forma mais idiomática em Haskell é tratar o caso vazio separadamente via pattern matching antes de chamar last:

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _)  = "Nenhuma banda escalada para encerramento."
bandaEncerramento (Evento bs _)  = nomeBanda (last bs)

O primeiro padrão captura a lista vazia; o segundo, qualquer lista não-vazia. Assim, last bs só é chamado quando bs tem pelo menos um elemento, evitando exceções em tempo de execução. Nunca use last sem garantir que a lista não está vazia!

Prompt 5 – Exercício 4 (Casa de Banhos da Yubaba)
Prompt enviado:

No Exercício 4, a função valorFinalAtendimento deve aplicar 25% de acréscimo se houver mais de 3 serviços. Como verificar o tamanho de uma lista dentro de um guard?

Resposta:

Você pode usar a função length diretamente no guard:

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
  | Cancelado <- statusAtendimento atendimento = 0.0
  | length (servicos atendimento) > 3          = total * 1.25
  | otherwise                                  = total
  where
    total = totalServicos (servicos atendimento)

length retorna o número de elementos da lista. Note que, para listas muito grandes, length percorre toda a lista (O(n)), mas para casos simples como este é perfeitamente adequado.

Prompt 6 – Dúvida geral sobre deriving (Show)
Prompt enviado:

Por que preciso colocar deriving (Show) em todos os meus tipos? O que acontece se eu não colocar?

Resposta:

O deriving (Show) faz o Haskell gerar automaticamente uma instância da typeclass Show para seu tipo. A typeclass Show define como um valor é convertido para String, o que é necessário para funções como print, putStrLn . show, e para o GHCi exibir valores.
Se você não derivar Show, ao tentar usar show meuValor ou print meuValor, o compilador lançará um erro indicando que não existe instância de Show para o seu tipo. Você poderia implementar Show manualmente com instance Show MeuTipo where show x = ..., mas deriving (Show) é a forma mais prática na maioria dos casos.

Relatório de Satisfação e Aprendizado

Exercício 1 – Café Leblanc

A explicação sobre record syntax foi fundamental. Antes da interação, eu sabia criar tipos simples como data Cor = Vermelho | Verde | Azul, mas não sabia como criar tipos com campos nomeados e acessá-los diretamente. O modelo mostrou que ao usar { nomeBebida :: String, ... }, o Haskell automaticamente cria funções seletoras com o mesmo nome do campo, o que torna o código muito mais legível.
O que aprendi:
Aprendi a diferença entre pattern guards (| Construtor <- expressao) e guards com igualdade (| expressao == Construtor). O pattern guard dispensa o deriving (Eq) e é mais expressivo quando o que importa é apenas identificar o construtor, sem comparar valores complexos. Também consolidei o uso de (b:_) em pattern matching para listas: o b captura a cabeça e _ ignora o restante da cauda sem necessidade de nomeá-la.

Exercício 2 – Lojas de Hyrule

A explicação sobre map e sum foi direta e suficiente. O ponto mais valioso foi o uso do bloco where para evitar recalcular totalItens em cada ramo do guard. Antes disso, eu teria repetido a expressão nos dois ramos, o que seria menos eficiente e menos legível.
O que aprendi:
Aprendi que o bloco where em Haskell não é apenas "sintaxe de açúcar" — ele tem impacto real na clareza e potencialmente na performance, pois o valor é calculado uma única vez. Também fixei que map f xs é a forma idiomática de transformar uma lista elemento por elemento em Haskell, substituindo laços for do paradigma imperativo.

Exercício 3 – Casa de Shows

O alerta sobre o uso seguro de last foi o ponto mais importante desta troca. A resposta deixou claro que last [] em Haskell lança uma exceção em tempo de execução (não um erro de compilação), e que a forma correta de se proteger é separar o caso de lista vazia via pattern matching antes de invocar last. Isso me ensinou a pensar em totalidade de funções — toda entrada possível deve ter um tratamento explícito.
O que aprendi:
Aprendi que funções como head, tail e last são chamadas de funções parciais em Haskell, pois não são definidas para listas vazias. Em código de produção, é preferível usar Maybe para tratar ausência de valor com segurança (Data.List.uncons, por exemplo). Para este exercício, o pattern matching manual foi suficiente e correto.

Exercício 4 – Casa de Banhos da Yubaba

A resposta confirmou o uso de length no guard para verificar a quantidade de elementos da lista. O modelo também mencionou a complexidade O(n) de length, o que foi útil para entender as limitações da abordagem e quando seria necessário usar estruturas de dados alternativas (como listas com comprimento armazenado).
O que aprendi:
Aprendi que em Haskell as listas encadeadas não armazenam seu tamanho, então length percorre toda a lista. Para programas com listas muito grandes onde a verificação de tamanho é frequente, seria melhor usar Data.Sequence ou armazenar o tamanho explicitamente no tipo de dados. Para os exercícios propostos, length é completamente adequado.

