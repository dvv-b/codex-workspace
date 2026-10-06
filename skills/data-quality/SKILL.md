---
name: data-quality
description: Avalie a qualidade de datasets ou implemente verificações reutilizáveis, selecionando dimensões relevantes e produzindo métricas auditáveis.
---

# Data Quality

Avalie a qualidade dos dados em função do contrato e do objetivo da tarefa.
Adapte a execução à stack existente, sem pressupor biblioteca, plataforma,
formato de armazenamento ou domínio de negócio.

## Contexto e contrato

Identifique o dataset, sua granularidade, o recorte analisado e o uso esperado.
Consulte o contrato e as regras fornecidas pelo projeto, documentação ou usuário.

Diferencie propriedades observadas de requisitos declarados: um schema inferido,
uma chave candidata ou um padrão frequente não constituem um contrato.

A análise deve consumir dados previamente preparados segundo um contrato conhecido.
Se ele estiver incompleto, explicite as lacunas e limite as conclusões. Prossiga
com profiling descritivo quando útil; peça esclarecimento quando a lacuna impedir
uma validação necessária.

## Seleção das verificações

Escolha somente as dimensões pertinentes ao objetivo, aos tipos de dados,
aos riscos e às evidências disponíveis. Justifique brevemente a seleção;
não execute uma bateria completa por padrão.

Considere, conforme necessário:

- schema e tipos;
- completude, NULLs e valores vazios;
- cardinalidade e valores distintos;
- duplicidade e unicidade;
- distribuição e concentração de valores;
- padrões estruturais;
- consistência entre atributos;
- outliers e anomalias;
- correlação e relações entre variáveis.

Defina a unidade de análise, as colunas e os critérios de cada verificação.
Explicite semânticas relevantes, como tratamento de NULLs, vazios, chaves
compostas e denominadores. Para análises estatísticas, registre método,
parâmetros e limitações.

Padrões predominantes, outliers, correlações e repetições são observações;
não os classifique automaticamente como erros. Unicidade e obrigatoriedade
dependem do contrato. Correlação não estabelece causalidade.

## Execução e organização

Execute ou implemente somente o necessário para a tarefa autorizada,
aproveitando as ferramentas e convenções do projeto.

Mantenha separadas:
- aquisição e preparação dos dados;
- verificações genéricas, independentes da origem física;
- regras de domínio, com sua fonte explícita;
- apresentação e consumo dos resultados.

Cada dimensão deve poder ser avaliada independentemente, compartilhando
preparação ou cálculos quando isso evitar trabalho redundante. Não imponha
uma estrutura de diretórios ou um framework novo.

Aplique regras de negócio somente quando fornecidas pelo projeto,
documentação ou usuário. Não invente limites, categorias, exceções ou
relações semânticas a partir dos nomes das colunas ou dos dados observados.

Distinga diagnóstico de correção: a avaliação não autoriza limpar,
excluir, imputar ou transformar registros para fazê-los passar.

## Resultados e evidências

Produza resultados estruturados no formato adequado aos consumidores do
projeto, reutilizáveis em relatórios, dashboards, alertas ou validações
automatizadas, sem acoplar o cálculo à apresentação.

Para cada verificação, informe quando aplicável:
- dimensão e identificação da métrica ou regra;
- natureza: observação descritiva, validação técnica ou regra de domínio;
- resultado observado, unidade e população avaliada;
- critério esperado e sua fonte, quando existentes;
- status;
- severidade ou impacto, somente com justificativa;
- colunas afetadas e quantidade ou referência segura dos registros afetados;
- evidência reproduzível;
- recomendação ou próximo passo.

Use os status do projeto. Na ausência deles, diferencie aprovado, reprovado,
observação, inconclusivo, não executado e erro de execução. Aprovação ou
reprovação exige um critério explícito; falha de execução não prova defeito
nos dados. Não atribua severidade arbitrária.

Registre contexto suficiente para reprodução: versão ou referência do
dataset e contrato, recorte, filtros, método, parâmetros e momento da análise.
Declare amostragem, aproximações e cobertura; não apresente resultados
amostrais como validação integral. Prefira evidências agregadas ou referências
seguras a reproduzir registros sensíveis.

Não crie um Data Quality Score automaticamente. Um score consolidado exige
metodologia, pesos e critérios explicitamente definidos pelo projeto.

## Validação e limites

Quando fizer sentido, sugira ou implemente testes para regras críticas e
regressões, incluindo casos válidos, inválidos e limites relevantes.

Separe verificações implementadas das efetivamente executadas. Informe
limitações, requisitos ausentes e o que permanece sem conclusão. Não declare
a qualidade integral do dataset com base apenas nas dimensões avaliadas.
