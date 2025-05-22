<p align="center">
	<img src="img/script-box.png" >
</p>

Bem-vindo à minha coleção de scripts utilitários em Bash, Python e Rust! Aqui você encontrará ferramentas para automatizar tarefas do dia a dia e simplificar seu fluxo de trabalho. Sinta-se à vontade para explorar, usar e até mesmo contribuir com suas próprias ideias e scripts!

### 💾 Scripts em Bash

| Script | Descrição | Funcionalidades |
|-|-|-|
| [connection.sh](https://github.com/nfoj/script-box/blob/main/shell/connection.sh) | Verifica a conectividade de rede. <br> | - Permite testar a conexão com: <br> &nbsp;&nbsp; - Google (8.8.8.8). <br> &nbsp;&nbsp; - Domínio especificado pelo usuário. <br> &nbsp;&nbsp; - Endereço IP fornecido. <br> - Interface interativa via menu. |
| [update.sh](https://github.com/nfoj/script-box/blob/main/shell/update.sh) | Tarefas de manutenção em Arch Linux. <br> | - Executa as seguintes ações: <br> &nbsp;&nbsp; - Verifica a conexão com a internet (ping ao Google). <br> &nbsp;&nbsp; - Atualiza o sistema (`pacman -Syu`). <br> &nbsp;&nbsp; - Remove pacotes órfãos (`pacman -Rns $(pacman -Qtdq)`). <br> &nbsp;&nbsp; - Limpa o cache da RAM. <br> &nbsp;&nbsp; - Pergunta se deseja reiniciar o sistema. <br> - Utiliza cores para feedback visual. |
| [server-stats.sh](https://github.com/nfoj/script-box/blob/main/shell/server-stats.sh) | Analisa estatísticas de desempenho do servidor. <br> | - Permite visualizar as seguintes informações: <br> &nbsp;&nbsp; - Usuário e Group. <br> &nbsp;&nbsp; - Ip, Netmask e Broadcast. <br> &nbsp;&nbsp; - CPU em uso. <br> &nbsp;&nbsp; - Disco Rigido (Tamanho do disco, espaço usado, memória disponível e porcentagem de uso). <br> &nbsp;&nbsp; - Uso da Memória e espaço livre. <br> &nbsp;&nbsp; - Temperatura do Processador e os 6 primeiros processos em andamento. |

### 🐍 Scripts em Python

| Script | Descrição | Funcionalidades |
|-|-|-|
| [connection.py](https://github.com/nfoj/script-box/blob/main/python/connection.py) | Testa a conectividade de rede. | - Utiliza a biblioteca `requests` para enviar uma requisição HTTP <br> - Utiliza códigos de escape ANSI: <br> &nbsp;&nbsp; - Azul para a mensagem inicial de teste. <br> &nbsp;&nbsp;  -  Verde para indicar conexão bem-sucedida. <br> &nbsp;&nbsp;  -  Vermelho para indicar falha na conexão. <br> - Imprime mensagens em caixas formatadas. |
| [rename_files.py](https://github.com/nfoj/script-box/blob/main/python/file_rename.py) | Renomeia arquivos em lote com base em um padrão. | - Solicita diretório, padrão de busca (regex) e novo nome base. &lt; <br> - Renomeia arquivos correspondentes, adicionando numeração sequencial. |
| ... |
