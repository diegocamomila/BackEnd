# Boas-vindas ao repositório do projeto Docker Todo List!



Neste projeto você irá:

- **_Conteinerizar_** aplicações;
- Criar uma conexão entre elas;
- Orquestrar seu funcionamento;

Temos uma aplicação full-stack neste repositório: um **aplicativo de tarefas**! Esta aplicação precisa ser conteinerizada para funcionar. Você deverá desenvolver os arquivos de configuração para cada frente específica: `Front-end`, `Back-end` e, no nosso caso, para um aplicativo de `teste` que valida se as aplicações estão se comunicando.

Você deverá criar as imagens para as aplicações e configurar essas imagens com o `docker-compose`.

Para isto, você irá utilizar uma série de comandos do `docker` com diferentes níveis de complexidade.

Cada comando deverá ser escrito em seu próprio arquivo.

Para isto, siga os seguintes passos:

1. Leia o requisito e crie um arquivo chamado `commandN.dc` no diretório `docker-commands`, onde `N` é o número do requisito. Por exemplo:

    ```text
    Requisito 1: ./docker/docker-commands/command01.dc
    Requisito 2: ./docker/docker-commands/command02.dc
    Requisito 3: ./docker/docker-commands/command03.dc
    ```

2. Escreva neste arquivo o comando do CLI *(Interface de Linha de Comando)* do Docker que resolve o requisito. Um exemplo de como vai ficar seu arquivo:

    ```dc
    docker network inspect bridge
    ```

Os arquivos principais do projeto estão na pasta `docker`, na raiz do projeto. Nela estão contidos:

1. Pasta `docker-commands`: onde ficarão os comandos exigidos pelos requisitos;
   - ** Importante: você deve assumir que essa é a pasta raiz para os comandos.**
   - Por exemplo, se você precisa referenciar um caminho em um comando, você deve assumir que sua pasta raiz esta partindo de `./docker`.
2. Pasta `todo-app`: onde fica a nossa **pseudo-aplicação**, que servirá como base para nossos `Dockerfile`s e `Compose`;
   - ** Essa aplicação conta com um [**README.md**] próprio, que deve ser usado como referência na criação dos scripts!**

Quando for necessário fazer a orquestração das aplicações, o arquivo `docker-compose.yml` deverá ser criado na pasta `./docker`.


### 1. Crie um container em modo interativo, sem rodá-lo, nomeando-o como `01container` e utilizando a imagem `alpine` na versão `3.12`
O avaliador executará o comando no arquivo `command01.dc`.

- O `nome` do container deve ser `01container`;

- O container deve usar a imagem `alpine` na versão `3.12`;

- O `status` do container deve ser `created`;

- O container **não deve** estar em execução após ter sido criado.
---

### 2. Inicie o container `01container`
O avaliador executará o comando no arquivo `command02.dc`.

- O avaliador verificará se o container está parado;

- O avaliador executará o comando criado neste requisito;

- O container **deve** estar em execução.
---

### 3. Liste os containers filtrando pelo nome `01container`
O avaliador executará o comando no arquivo `command03.dc`.

- O comando deve retornar uma lista contendo informações **apenas** do `01container`.
---

### 4. Execute o comando `cat /etc/os-release` no container `01container` sem se acoplar a ele
O avaliador executará o comando no arquivo `command04.dc`.

- Que o comando retornará os dados corretos da `distro` no container:
  - `NAME="Alpine Linux"`
  - `ID=alpine`
  - `VERSION_ID=3.12`
---

### 5. Remova o container `01container`
O avaliador executará os comandos nos arquivos `command05.dc` e `command03.dc`.

- O avaliador rodará o comando 5;

- O avaliador validará o processo com o comando 3.
---

### 6. Faça o download da imagem `nginx` com a versão `1.21.3-alpine` sem criar ou rodar um container
O avaliador executará o comando no arquivo `command06.dc`.

  - Que a imagem correta foi baixada;

  - Que nenhum container foi iniciado para isso.
---

### 7. Rode um novo container com a imagem  `nginx` com a versão `1.21.3-alpine` em segundo plano nomeando-o como `02images` e mapeando sua porta padrão de acesso para porta `3000` do sistema hospedeiro
O avaliador executará o comando no arquivo `command07.dc`.

  - Que o container foi iniciado corretamente;

  - Que é possível ter acesso ao container pelo endereço `localhost:3000`;

  - Que a página retorna o valor esperado.
---

### 8. Pare o container `02images` que está em andamento
O avaliador executará o comando no arquivo `command08.dc`.

  - Que não há nenhum container ativo após seu comando.
---

## Dockerfile

**⚠️ As aplicações a seguir contam com um [**README.md**] próprio, que deve ser usado como referência na criação dos scripts!**

### 9. Gere uma build a partir do Dockerfile do `back-end` do `todo-app` nomeando a imagem para `todobackend`
O avaliador executará o comando no arquivo `command09.dc`.

- Se existe um arquivo `Dockerfile` em `./docker/todo-app/back-end/`:

  - O Dockerfile deve rodar uma imagem `node` utilizando a versão `14`;

    - Recomenda-se o uso da variante `-alpine`, pois ela é otimizada para desempenho;

    - Lembre-se de consultar o README do `todo-app` para validar os requisitos da aplicação.

  - Deve estar com a porta `3001` exposta;

  - Deve adicionar o arquivo `node_modules.tar.gz` a imagem;

  - Deve copiar todos os arquivos da pasta `back-end` para a imagem;

  - Ao iniciar a imagem deve rodar o comando `npm start`.

- Se ao *buildar* o Dockerfile o nome da imagem gerada é igual a `todobackend`.
---

### 10. Gere uma build a partir do Dockerfile do `front-end` do `todo-app` nomeando a imagem para `todofrontend`
O avaliador executará o comando no arquivo `command10.dc`.

  - Se existe um arquivo `Dockerfile` em `./docker/todo-app/front-end/`:

    - O `Dockerfile` pode rodar uma imagem `node` utilizando a versão `14`;

      - Recomenda-se o uso da variante `-alpine`, pois ela é otimizada para desempenho;

      - Lembre-se de consultar o README do `todo-app` para validar os requisitos da aplicação.

    - Deve estar com a porta `3000` exposta;

    - Deve adicionar o arquivo `node_modules.tar.gz` a imagem, de maneira que ele seja extraído dentro do `container`;

    - Deve copiar todos os arquivos da pasta `front-end` para a imagem;

    - Ao iniciar a imagem deve rodar o comando `npm start`;

  - Se ao *buildar* o `Dockerfile` o nome da imagem gerada é igual a `todofrontend`.
---

### 11. Gere uma build a partir do Dockerfile dos `testes` do `todo-app` nomeando a imagem para `todotests`
O avaliador executará o comando no arquivo `command11.dc`.

- A aplicação `todotests` só funciona corretamente se estiver dockerizada e dentro de uma rede docker configurada corretamente.

- Se existe um arquivo `Dockerfile` em `./docker/todo-app/tests/`:

  - O Dockerfile deve rodar a imagem `mjgargani/puppeteer:trybe1.0` para que os testes funcionem;

  - Deve adicionar o arquivo `node_modules.tar.gz` a imagem;

  - Deve copiar todos os arquivos da pasta `tests` para a imagem;

  - Ao iniciar a imagem deve rodar o comando `npm test`;

- Se ao *buildar* o Dockerfile o nome da imagem gerada é igual a `todotests`.
---

## Docker-compose

### 12. Suba uma orquestração em segundo plano com o docker-compose de forma que `backend`, `frontend` e `tests` consigam se comunicar
O avaliador executará o comando no arquivo `command12.dc`. Este comando pressupõe a existência do arquivo `./docker/docker-compose.yml`.

O `docker-compose` deve rodar na versão 3 ou superior.

- Use as imagens já **"buildadas"** que foram executadas nos requisitos 9, 10 e 11 para a criação do compose;

- Consulte a documentação em `./docker/todo-app/README.md`;

- É possível adicionar e extrair arquivos `.tar.gz` no `Dockerfile` com apenas um comando.

- O container de `todotests` deve ter como dependencia os containers `frontend` e `backend`;

- O nome do _service_ deverá ser `todotests`;

- Deve ter uma variável de ambiente `FRONT_HOST` que recebe como valor o nome do container do `frontend`

  - Lembrando que, dentro de uma rede docker, o host de um container é indentificado pelo seu nome.


##### front-end

- O container de `todofrontend` deve rodar na porta `3000`;

- O nome do _service_ deverá ser `todofront`;

- Deve ter como dependencia o container `backend`;

- Deve ter uma variável de ambiente `REACT_APP_API_HOST` que recebe como valor o nome do container do `backend`.
  - Lembrando que, dentro de uma rede docker, o host de um container é indentificado pelo seu nome.

##### back-end

- O container de `todobackend` deve rodar na porta `3001`;

- O nome do _service_ deverá ser `todoback`;
