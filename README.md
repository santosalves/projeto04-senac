# Projeto04-Senac

Requisitos para rodar este projeto:

* Três máquinas virtuais com Linux e o Docker instalado.
* Uma máquina com um Servidor DNS servindo os hosts do Docker.
* Servidor DNS com o domínio projeto04.local e os seguintes registros do tipo A:
  * Três registros com o nome wordpress apontando para o IP de cada um dos hosts do docker.
  * Um registro com o nome docker01 apontando para o IP de um dos hosts.
  * Um registro com o nome docker02 apontando para o IP de um dos hosts.
  * Um registro com o nome docker03 apontando para o IP de um dos hosts.
 
Alterações especiais feitas para que fosse possível rodar o projeto da forma correta:
  * Dentro do arquivo wp-config.php, no campo em que digitamos as informações para conexão com o banco de dados, foi utilizada a função getenv() do PHP para ler as variáveis de ambiente definidas no docker-compose.yml.
  * Ainda no arquivo wp-config, foi alterado para TRUE o valor da função WP_DEBUG. O intuito é que já fosse mostrado na tela a saída dos erros referentes as conexões do Wordpress.
  * No arquivo install.php foi adicionada uma linha de comando do WP CLI que executa no sistema uma automação de instalação do Wordpress. São definidos: URL do site, título, nome do usuário padrão e a senha do mesmo.
  * Ainda no arquivo install.php, o valor da função WP_INSTALLING foi alterada para FALSE.
  * No arquivo nginx.conf, dentro da pasta loadbalance, foi necessário definir como nome do UPSTREAM a URL do site para que o balanceamento fosse feito de forma correta.
