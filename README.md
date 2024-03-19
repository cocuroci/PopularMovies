# PopularMovies

## Inspiração

Projeto inspirado no desafio [7DaysOfCode](https://7daysofcode.io/matricula/ios) proposto pela `Giovanna Moeller`. O desafio consiste em fazer uma pequena aplicação em 7 dias.

## Descrição

O PopularMovies é um aplicativo simples onde a home exibe uma lista dos filmes populares com possibilidade de ver mais detalhes desse filme acessando a view de detalhes.

A API utilizada para a consulta desses filmes foi a `TheMovieDB`

## Tecnologia

- A arquiterura escolhida foi a VIP + Coordinator para a navegação entre as telas.
- Na parte de Network resolvi utilizar o `async await` do swift para facilitar as chamadas de rede e dimunir o uso de callbacks (`closusres`)
- Para gerar o projeto escolhi o `Tuist`. Além de ser uma ferramenta simples os arquivos são escritos em `.swift` facilitando o entendimento de quem já conhece a linguagem.

## Requisitos

- XCode 14
- Tuist 3.15.0
- Swift 5.7

## Configuração

Para `rodar` o projeto é necessário instalar o `Mise` e o `Tuist`

Rodar o comando abaixo no terminal na raiz do projeto
- `tuist generate`

Com tudo instalado basta criar um arquivo chamado `Constants.swift` e adicionar uma variávem estática chamada `apiKey`, exemplo:

```
enum Constants {
    static let apiKey = "SUA_API_KEY"
}
```

## Melhorias

Hoje eu faria pequenas melhorias no projeto como:
- O melhor lugar para salvar e utilizar a APIKey da `TheMovieDB`
- Separar melhor as funcionalidades/core em módulos como
    - Um módulo para `Network` para reaproveitar em outros projetos
    - Quem sabe um módulo `shared` com pequenas funcionalidades que poderiam ser utilizados em outros módulos
    - Separar as funcionalidades de `Home` e `Detail` em um módulo a parte
    - O App principal ser apenas uma casca que monta os módulos conforme a necessidade
    - Criar testes unitários

## Exemplos de testes unitários

Como o projeto `TheMovieDB` não contém testes, abaixo vou listar alguns repositórios mais antigos com testes:
- <https://github.com/cocuroci/app-tmdb/tree/master/TMDBTests>
- <https://github.com/cocuroci/FeedMe/tree/main/FeedMeTests>
- <https://github.com/cocuroci/tweet-sentiment-analysis/tree/main/TweetSentimentAnalysis/TweetSentimentAnalysisTests>