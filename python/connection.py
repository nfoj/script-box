# Importa o módulo requests, que permite fazer solicitações HTTP em Python.
import requests

# Define uma função chamada verifica_conexao_internet.
def verifica_conexao_internet():
    try:
        # Tenta fazer uma solicitação GET para o site do Google.
        response = requests.get("http://www.google.com")

        return response.status_code == 200           
        
    except requests.ConnectionError:
        # Em caso de erro de conexão, retorna False.
        return False

# Chama a função verifica_conexao_internet e verifica o valor retornado.
if verifica_conexao_internet():
    # Se a função retornar True, imprime "Conexão com a Internet ativa."
    print("Conexão com a Internet ativa.")
else:
    # Se a função retornar False, imprime "Sem conexão com a Internet."
    print("Sem conexão com a Internet.")

