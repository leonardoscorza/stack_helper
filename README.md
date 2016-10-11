# README

![alt tag](https://codeship.com/projects/eeb1a760-7173-0134-f7f4-4aa32a10a3f8/status?branch=master)


### Documentação

Página: https://leonardoscorza.github.io/stack_helper_docs<br/>
Repositório: https://github.com/leonardoscorza/stack_helper_docs


### Dependências

* Ruby version
Version 2.2.2 or Later

* Database creation
Make sure you have PostgreSQL 9.1 or Later installed

* Registro com Facebook
Para fazer o login através do Facebook é necessario realizar o import das variaveis localmente.
$ export FACEBOOK_APP_SECRET=secret_face
$ export FACEBOOK_APP_ID=id_face

O valor das variaveis acima "secret_face e id_face" deveram ser substituidas pelas chave de sua aplicação criada no Facebook.
sobre como criar uma aplicação no Facebook e integrar com a sua app, assista:
http://onebitcode.com/criando-autenticacao-com-o-facebook-em-10-minutos-devise-omniauth/


# O Projeto

### Stack Helper

#### O projeto
Um sistema Open Source para que desenvolvedores de software possam solucionar suas dúvidas com a ajuda de desenvolvedores com mais experiéncia no ponto de dúvida.

**Pontos importantes**
* O sistema vai associar ao desenvolvedor que responde a dúvida um botão para receber doações ($1 por exemplo).
* Os desenvolvedores podem escolher hashtags que sejam do seu domínio para serem notificados quando perguntas relacionadas a essas tags forem feitas.
* O sistema vai permitir que os usuários façam suas perguntas associadas a hashtags, aumentando assim suas chances de ter suas dúvidas respondidas.
* Vai ser possível filtrar as perguntas e respostas do sistema através de Hashtags.
* Os desenvolvedores que tiverem mais respostas vão ficar no ranking na página inicial do site associados aos seus botões de doação, aumentando assim as chances que recebam essas doações.


### Quer ajudar o projeto?
Dê um fork no projeto

Vá no repositorio que o git criou e copie a url, digite git clone e cole o link

git clone https://github.com/seu-nome/stack_helper

Entre no diretório
$ cd stack_helper

Faça suas alteraçoes

Crie um branch (ramificação) do projeto

(comando que fecha a master)	$ git checkout master

(comando que cria a branch)	 $ git branch nome-da-branch

(comando git remote -v para sincronizar seu fork) $ git remote add upstream https://github.com/...

Para subir o projeto

(comando que adiciona as alteraçoes feitas) $ git add .

(comitando a alteração) $ git commit -m 'Mensagem sobre a modificação'

(dando o push no projeto para que seja feito o pull request) git push origin nome-da-branch

e por ultimo vá até o seu repositório no github (parte gráfica) e faça o pull request.
