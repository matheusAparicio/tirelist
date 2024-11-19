# TireList
Teste prático para vaga de desenvolvedor Flutter.
O prazo proposto para o desenvolvimento deste aplicativo foi de 3 dias corridos e suas funcionalidades são as de mostrar uma lista de pneus obtidas via API e mostrar detalhes específicos do pneu selecionado.

Desenvolvido com Flutter 3.24.3

## Sumário
Devido ao prazo fornecido, optei por direcionar meu foco, em especial, na arquitetura e organização do projeto, e menos no design das telas.
Em praticamente todos os meus projetos de Flutter até o momento, havia usado o MobX para gerenciamento de estado. No entanto, após conferir o artigo do Gustavo Navarro no Medium acerca de ferramentas para gerencimento de estado, decidi sair da zona de conforto e usar a arquitetura MVVM e ferramentas disponibilizidas por padrão pelo Flutter para essa finalidade, como o ValueListenableBuilder e o addListener.

## Estrutura de arquivos
- lib
  - domain
    - entities
    - model
    - state
  - services
    - external
    - internal
  - view_model
  - ui
    - custom_widgets
    - pages
    - themes
  - utilities
 
### Domain
Camada de domínio do projeto, nela contém as entities, responsáveis por serem uma forma mais eficiente de se manusear informações obtidas através de JSONs nas respostas de requisições.
State, onde ficam os estados de cada tela e, por fim, os models. Esses que são responsáveis pela lógica de negócios e armazenamento de dados das telas.

### Services
Serviços do aplicativo, separados por externos e internos. Os externos sendo responsáveis por se comunicar com APIs através do package Http e os internos sendo responsáveis por manuseamento de dados internos do aplicativo, como o serviço de I18n "manual" que criei.

### View Model
Responsável por guardar os view models do aplicativo. Esses que, por sua vez, são responsáveis por encapsular a lógica de negócio da camada puramente visível do aplicativo e interagir com os models.

### UI
Camada visível ao usuário do aplicativo, com uma pasta para widgets personalizados e reutilizáveis, uma para as telas do aplicativo e uma para classes utilitárias, sendo essas, 3: Uma para as cores do aplicativo, uma para os estilos de texto e uma para medidas.

### Utilities
Classes e funções utilitárias do aplicativo, como uma para armazenar as labels de tradução.

## Observações e comentários
O I18n poderia ter sido implementado inserindo o devido package ao projeto, no entanto, optei por implementar de forma "manual", pois não vi motivo para um package a mais no projeto. Da forma que foi implementado, por uma questão de tempo e prioridade que dei a essa questão, a linguaguem usada sempre será a "ptBr", mas as labels de tradução para o inglês estão devidamente preparadas.

No "AppTextStyles", há uma quantidade considerável de código repetido. Poderia ter sido evitado ao transformar os TextStyles em funções que recebam parâmetros de customização, como cor do texto. E, claro, removendo os TextStyles parecidos entre si. Novamente, não o fiz pela questão do tempo restante.

Criei uma classe personalizada para fazer as requisições Http para reaproveitar o tratamento de erros e header de autenticação.

Toda a lógica por trás das telas ficou por conta das view models. A única lógica que deixei por conta do UI foram as aberturas dos dialogs.

Alguns feedbacks visuais para o usuário também faltaram, como uma possível mensagem de lista vazia na TireListPage e formatação do valor de compra dos pneus de double para string em formato monetário adequado.

## Instruções para execução do projeto
É necessário possuir o Flutter e Android SDK instalados no seu dispositivo.

Para executar o projeto, basta o clonar em seu computador e, na pasta do projeto, executar "fluter pub get". Após isso, rode o projeto em algum dispositivo ou simulador mobile. (Testado apenas em Android)

Em caso de dúvidas, é possível rodar o "flutter doctor" para conferir se sua instalação do Flutter está correta.
  
## Pacotes externos
Para o desenvolvimento deste projeto, foram adicionados apenas 3 packages de forma pontual. O papel desses 3 poderia ter sido cumprido usando apenas as ferramentas padrões do Flutter, optei por usá-los por uma questão de praticidade.

### Http
Pacote publicado pela equipe oficial do Dart, amplamente usado e testado. Usado para fazer as requisições externas que o aplicativo necessitava. Em específico, no TireService.

### Lottie
É um pacote feito de forma independente responsável por fornecer uma forma de renderizar animações do Lottie nativamente no mobile. Lottie é um site com diversas animações personalizáveis e disponíveis e de uso livre para desenvolvimento de aplicativos, sites e outras mídias. Foi usado para fins puramente estéticos do projeto.

### Google Fonts
Pacote publicado pela equipe oficial do Material Design da Google. Permite o uso das fontes do fonts.google.com.
