Nome: Débora de Farias Negri Matrícula: 768

Histórico de Prompts e Respostas Obtidas:

Prompt enviado:

Em Common Lisp, consigo usar mais de uma condição numa mesma cláusula do cond? Por exemplo, quero retornar "10ml" se a idade for menor que 6 ou o peso for menor que 20. Tentei assim mas não funcionou:
(cond
  ((< idade 6) (< peso 20.0)) "10ml")

Resposta:

Você está quase lá! O problema é que colocou as duas condições separadas dentro da cláusula, mas o cond espera apenas uma expressão de teste por cláusula. Para combinar duas condições com "ou", você usa o or:

(cond
  ((or (< idade 6) (< peso 20.0)) "10ml")
  ...)

O or retorna o primeiro valor verdadeiro que encontrar, então (or (< idade 6) (< peso 20.0)) será verdadeiro se qualquer uma das duas condições for. Da mesma forma, você usaria and se precisasse que as duas fossem verdadeiras ao mesmo tempo.

Prompt enviado:

Em Common Lisp, como comparo uma string com um valor fixo? Tentei usar = mas deu erro. Estou tentando fazer algo assim:
(cond
  ((= nome "Ginseng") (* base 3.0))
  ...)

Resposta:

O = em Common Lisp é só para números. Para comparar strings, você usa string=:

(cond
  ((string= nome "Ginseng") (* base 3.0))
  ((string= nome "Lotus")   (* base 1.5))
  (t base))

O t no final do cond funciona como o "otherwise" — é sempre verdadeiro, então cobre todos os casos que não se encaixaram acima. Existem também string<, string>, string-equal (que ignora maiúsculas/minúsculas), entre outros, dependendo do que você precisar comparar.

Prompt enviado:

Estou tentando filtrar uma lista em Common Lisp, mas a função filter não existe aqui. Em Haskell eu usaria filter, mas no Lisp não achei o equivalente. Qual é a função certa para filtrar elementos de uma lista com base numa condição?

Resposta:


Em Common Lisp o equivalente ao filter do Haskell é remove-if ou remove-if-not, dependendo do que você quer fazer:

remove-if remove os elementos para os quais o predicado é verdadeiro (ou seja, mantém os que são falsos).
remove-if-not remove os elementos para os quais o predicado é falso (mantém os que são verdadeiros — equivalente direto ao filter).

Exemplo para manter só criaturas com periculosidade diferente de 'BAIXA:

(remove-if #'(lambda (c) (eq (criatura-periculosidade c) 'BAIXA)) catalogo)

O #' antes do lambda é a notação de Common Lisp para passar uma função como argumento. E eq é o comparador adequado para símbolos (como 'BAIXA, 'ALTA), diferente de string= que você usaria para strings.

Prompt enviado:

Em Common Lisp, posso encadear um remove-if-not com um mapcar numa mesma expressão, sem precisar de uma variável intermediária? Tipo, filtrar uma lista e já transformar os elementos resultantes?

Resposta:

Sim, dá pra encadear diretamente passando o remove-if-not como argumento do mapcar:

(mapcar #'(lambda (c)
            (format nil "~a: Vive em ~a"
                    (criatura-nome c)
                    (criatura-ambiente c)))
        (remove-if-not #'(lambda (c)
                           (string= (criatura-ambiente c) "Deep"))
                       catalogo))

O mapcar recebe a lista já filtrada como segundo argumento. Fica tudo numa expressão só, sem precisar de let. É o estilo funcional típico: você compõe as transformações de fora para dentro.

Prompt:

Em Common Lisp, criei um let com duas variáveis onde a segunda depende da primeira, mas está dando erro dizendo que a primeira variável não existe. Exemplo:
(let ((so-armas (remove-if-not ...))
      (com-imposto (mapcar ... so-armas)))
  ...)
Por que so-armas não é reconhecida na segunda linha?

Resposta:

Esse é um comportamento clássico do let em Common Lisp: todas as variáveis são avaliadas ao mesmo tempo, então uma não enxerga a outra. Para encadear variáveis onde cada uma depende da anterior, você usa let*:
(let* ((so-armas     (remove-if-not ...))
       (com-imposto  (mapcar ... so-armas))
       (com-bonus    (mapcar ... com-imposto)))
  ...)
Com let*, cada variável é avaliada em ordem e já está disponível para as seguintes. É exatamente o que você precisa para esse tipo de pipeline de transformações.

Prompt enviado:

Em Common Lisp, posso usar or dentro de um cond para comparar um símbolo com dois valores diferentes? Tipo, quero que a mesma cláusula ative se o elemento for 'PYRO ou 'ELECTRO. Isso funciona?
(cond
  ((or (eq elem 'PYRO) (eq elem 'ELECTRO)) (* recomp 1.20))
  ...)

Resposta:

Sim, funciona perfeitamente! O or pode receber qualquer expressão que retorne verdadeiro ou falso, incluindo eq. Então (or (eq elem 'PYRO) (eq elem 'ELECTRO)) é válido e faz exatamente o que você quer: a cláusula ativa se elem for qualquer um dos dois símbolos.
Só uma observação: eq é o comparador correto para símbolos em Common Lisp (comparação de identidade). Para strings você usaria string=, e para números =. Misturar esses comparadores é um erro comum quando se vem de outras linguagens.

Relatório de Satisfação e Aprendizado:

Exercício 1 — Farmácia da Maomao

Comecei o exercício sem maiores problemas na definição da struct e na lógica geral, mas travei em duas partes específicas. A primeira dúvida foi sobre como combinar condições no cond — eu tinha tentado colocar dois testes separados na mesma cláusula, o que não funcionou. A IA esclareceu rapidamente que o correto é usar or ou and para combinar as condições em uma única expressão de teste. A segunda dúvida foi sobre comparação de strings: eu vinha usando =, que funciona para números, mas não para texto. Saber que string= é o operador certo para strings, e entender que o Lisp separa operadores por tipo, foi algo que ficou bem claro depois da resposta e que apliquei nos exercícios seguintes sem precisar perguntar de novo.

Exercício 2 — Fauna de Planet 4546B

O maior obstáculo aqui foi descobrir o equivalente ao filter do Haskell. Eu sabia o que queria fazer — filtrar uma lista com um predicado — mas não achava a função certa em Common Lisp. A resposta foi muito útil porque não só apontou remove-if e remove-if-not, mas também explicou a diferença entre os dois e quando usar cada um, o que me poupou de perguntar de novo. A segunda dúvida, sobre encadear remove-if-not com mapcar, foi resolvida com um exemplo direto. Aprendi que em Lisp a composição de funções é feita passando o resultado de uma como argumento da outra, o que é mais conciso do que criar variáveis intermediárias para tudo.

Exercício 3 — Loja Clandestina de Iwai

Esse exercício exigiu encadear três transformações em sequência, e o erro com let foi frustrante até entender a causa. A resposta sobre let* foi curta e precisa — explicou exatamente por que o let comum não funciona para esse caso (avaliação simultânea das variáveis) e mostrou a solução. Depois disso consegui terminar o restante do exercício sem dificuldade. Foi o aprendizado mais prático da lista: let* para pipelines de dados dependentes é algo que vou usar com frequência em Lisp.

Exercício 4 — Viajantes de Teyvat

Aqui eu só precisei confirmar um detalhe de sintaxe: se or funcionava dentro de cond com comparações por eq. Era uma dúvida pequena, mas que travava meu raciocínio porque eu não queria escrever duas cláusulas separadas com a mesma lógica de resultado. A resposta confirmou que funciona e ainda aproveitou para consolidar quando usar eq versus string= versus =, o que foi um resumo útil de algo que eu já havia aprendido em partes nos exercícios anteriores. No geral, usar a IA para tirar dúvidas pontuais foi muito mais eficiente do que tentar adivinhar a sintaxe ou procurar na documentação sem saber o nome exato das funções.
