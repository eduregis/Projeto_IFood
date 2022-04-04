# Projeto_IFood
Projeto feito para desenvolver uma nova aplicação simples de tema à meu critério, para a avaliação técnica do IFood. Para o projeto, escolhi uma das sugestões dadas de fazer uma listagem de filmes consumindo uma API. Escolhi a GhibliApi, que possui informações sobre todos os filmes de animação produzidos pelo Studio Ghibli.

![60](https://user-images.githubusercontent.com/26663780/161566719-059676c8-dea9-441e-8e51-8443d674f6d6.png)
[Ícone baseado no personagem Totoro, do filme Meu vizinho Totoro, do Studio Ghibli. O ícone foi feito por mim mesmo]

### Descrição da aplicação

A aplicação possui:
* 2 telas principais:
  *  ListMovie
     *  Lista de todos os filmes.
     *  Quando selecionamos a célula de algum filme da lista, a tela MovieDetail é chamada como uma modal.
  *  MovieDetail 
     *  Tela com informações do filme selecionado, com nome (original e em inglês), ano de lançamento, diretor e descrição.
* Persistência local para caso de falta de internet.
* Filtragem por nome na tela ListMovie.
* Realização de Testes Unitários.

### Arquitetura

- MVVM (Model - View - ViewModel)

### Consumo da API
- https://ghibliapi.herokuapp.com/
