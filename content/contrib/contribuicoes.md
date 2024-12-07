+++
date = '2024-12-07T10:54:00-03:00'
draft = false
title = 'Contribuições'
[params]
  author = 'Guionardo Furlan'
+++

Sua contribuição será sempre bem-vinda.

Usaremos o repositório [lazarus-brasil](https://github.com/lazarus-brasil/https://github.com/lazarus-brasil/lazarus-brasil.github.io) para armazenar toda a documentação.

Este repositório usa algumas actions do github para gerar automaticamente o frontend.

Esta documentação é construída utilizando a ferramenta [Hugo](https://gohugo.io), a partir de arquivos de marcação nos formatos:

* [Markdown](https://gohugo.io/content-management/formats/#markdown)
* [HTML](https://gohugo.io/content-management/formats/#html)
* [AsciiDOc](https://gohugo.io/content-management/formats/#asciidoc)
* [EmacsOrgMode](https://gohugo.io/content-management/formats/#emacs-org-mode)
* [PanDoc](https://gohugo.io/content-management/formats/#pandoc)
* [reStructuredText](https://gohugo.io/content-management/formats/#restructuredtext)

Para termos uma qualidade da documentação, as actions farão validação do conteúdo produzido, inicialmente fazendo o linting dos markdowns.

A customização de cada artigo documentado responde a um cabeçalho no padrão [`front matter`](https://gohugo.io/content-management/front-matter/). Vale a pena uma olhada na documentação do `hugo` para entender melhor como isso funciona.

No repositório, a branch principal é a `main`, e por questões de segurança ninguém tem permissão de fazer push diretamente a ela.

> É necessário criar uma branch derivada da main, adicionar seus conteúdos e criar um pull-request.
> Cada pull-request deve passar pela validação automática da formatação do markdown e ser aprovado por outro contribuidor.
> Assim, podemos ter um controle do que foi adicionado à documentação, e por quem.
