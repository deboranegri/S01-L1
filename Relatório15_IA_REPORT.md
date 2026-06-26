Nome: Débora de Farias Negri
Matrícula: 768

Histórico de Prompts e Respostas Obtidas

Prompt 1

Mensagem enviada:

Tenho um banco de dados em Prolog com predicados como componente/3, precisa/2 e possui/2 representando componentes de naves espaciais e hangares. No Exercício 1, preciso escrever uma regra peca_critica(P) que seja verdadeira se o componente P consumir mais de 5 MW de energia E for necessário para pelo menos dois componentes diferentes. O enunciado dá a dica de usar precisa(P1, P) e precisa(P2, P) com P1 = P2. Eu entendo que o = em Prolog testa não-unificabilidade, mas fiquei com dúvida: essa abordagem com duas variáveis distintas pode gerar duplicatas quando eu rodar a query, já que o Prolog vai encontrar múltiplos pares (P1, P2) para o mesmo componente?

Resposta:

O modelo confirmou que = é o operador de não-unificação em Prolog — ele tem sucesso se os dois termos não puderem ser unificados, e falha caso contrário. Para átomos ground como nomes de componentes, ele funciona como uma comparação de igualdade invertida. A regra correta ficou assim:

peca_critica(P) :-
    componente(P, Consumo, _),
    Consumo > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.

Sobre a duplicação: sim, o Prolog pode retornar o mesmo P mais de uma vez via backtracking, pois encontra múltiplos pares (P1, P2) distintos para o mesmo componente. Para obter resultados únicos na query, o modelo sugeriu usar setof/3:

?- setof(P, peca_critica(P), Lista).

Com o banco fornecido, os componentes que satisfazem a regra são propulsor_ion (8 MW, necessário para dobra_espacial, ia_navegação e canhao_laser) e modulo_suporte_vida (8 MW, necessário para ia_navegação, scanner_deep_space e android_reparo).

Resultado da Query ?- peca_critica(P).: propulsor_ion, modulo_suporte_vida

Prompt 2

Mensagem enviada:

Ainda no Exercício 1, preciso montar a query que encontra componentes da categoria sistemas que consomem 6 MW e não são necessários para nenhum outro componente. Como uso o + para isso? Fico confuso sobre o que exatamente o + nega — ele nega o predicado inteiro ou apenas o próximo termo?

Resposta:

O modelo explicou que + é o operador de negação por falha em Prolog: ele tem sucesso quando o objetivo entre parênteses falha, e falha quando o objetivo teria sucesso. Portanto + precisa(_, P) é verdadeiro quando o Prolog não encontra nenhum fato precisa(Algo, P) na base. A query ficou assim:

?- componente(P, sistemas, 6), \+ precisa(_, P).

O modelo alertou que + nega o próximo termo completo — se o objetivo for uma conjunção, é obrigatório usar parênteses: + (cond1, cond2). Sem parênteses, apenas cond1 seria negada. Analisando o banco, o único componente de sistemas com 6 MW é scanner_deep_space, mas precisa(estacao_pesquisa, scanner_deep_space) existe — portanto a query não retorna resultados.

Resultado da Query ?- componente(P, sistemas, 6), \+ precisa(_, P).: false (scanner_deep_space tem 6 MW e é sistemas, mas estacao_pesquisa depende dele)

Prompt 3

Mensagem enviada:

No Exercício 2, preciso criar a regra hangar_combate(H) que seja verdadeira se H possuir duas peças distintas da categoria combate, e a regra falta_energia(H) que seja verdadeira se H não possuir nenhuma peça da categoria propulsao. Escrevi falta_energia assim:

falta_energia(H) :-
    \+ possui(H, P),
    componente(P, propulsao, _).

Mas desconfio que está errado. Qual é o problema com essa versão e como ficaria a forma correta?

Resposta:

O modelo confirmou que a versão estava errada. O problema é que + possui(H, P) nega apenas o primeiro termo, deixando componente(P, propulsao, _) fora do escopo da negação. Além disso, P ficaria livre dentro do +, o que causa comportamento indefinido. A negação precisa envolver a conjunção inteira entre parênteses. As regras corretas ficaram assim:

hangar_combate(H) :-
    possui(H, P1),
    componente(P1, combate, _),
    possui(H, P2),
    componente(P2, combate, _),
    P1 \= P2.

falta_energia(H) :-
    possui(H, _),
    \+ (possui(H, P), componente(P, propulsao, _)).

O modelo também explicou que possui(H, _) antes da negação serve para ancorar H ao universo real de hangares — sem isso, H ficaria livre e o Prolog poderia gerar resultados com hangares inexistentes na base.

Relatório de Satisfação e Aprendizado

Como a Resposta Ajudou na Solução

De modo geral, as respostas do modelo foram precisas e direcionadas. O mais valioso não foi apenas receber o código pronto, mas ter as dúvidas conceituais respondidas com clareza — especialmente nos pontos onde eu já tinha uma hipótese e queria validá-la. O modelo funcionou bem como par de revisão: confirmava o que estava certo, corrigia o que estava errado e acrescentava detalhes que eu não havia considerado, como o risco de variáveis livres dentro de negações ou a necessidade de ancorar hangares com possui(H, _) antes de aplicar +.

O único ponto onde a resposta poderia ter ido além foi no Exercício 2: após confirmar que nenhum hangar satisfaz hangar_combate simultaneamente com falta_energia, seria útil se o modelo tivesse sugerido como enriquecer o banco para produzir resultados mais interessantes — por exemplo, adicionando uma segunda peça de combate a algum hangar sem propulsão.

