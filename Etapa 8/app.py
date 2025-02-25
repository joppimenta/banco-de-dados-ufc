from datetime import datetime, time
import pandas as pd
import streamlit as st
from sqlalchemy import create_engine, text

# Conexão com o bando de dados
DB_USER = "joao_pimenta"
DB_PASSWORD = "joao123"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "ufc-bd"

engine = create_engine(f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# Carregar arquivo com a query
def load_query(file_path):
    with open(file_path, "r") as file:
        return text(file.read())

# Rodar a Query SQL
def run_query(query, params={}):
    with engine.connect() as connection:
        result = connection.execute(query, params)
        if result.returns_rows:
            df = pd.DataFrame(result.fetchall(), columns=result.keys())  # Converte para DataFrame
            return df
        connection.commit()
    return None

st.title("Sistema de Leilões")

# Opções
opcao = st.radio("Escolha uma ação:", ["Consultar Lances", "Criar Leilão", "Deletar Usuário"])

# --- Opção 1: Consultar Lances de um usuário---
if opcao == "Consultar Lances":
    nome_usuario = st.text_input("Digite o nome do usuário que você quer ver os lances:")

    if st.button("Executar Consulta"):
        if nome_usuario:
            try:
                query = load_query("select.sql")  # Lendo a query
                df = run_query(query, {"nome_usuario": nome_usuario})  # Executa a query com os parametros
                if df is not None and not df.empty:
                    st.dataframe(df)  # Exibe os resultados
                else:
                    st.warning("Nenhum resultado encontrado.")
            except Exception as e:
                st.error(f"Erro ao executar a consulta: {e}")
        else:
            st.warning("Digite um nome antes de executar a consulta.")

# --- Opção 2: Criar Leilão ---
elif opcao == "Criar Leilão":
    nome_produto = st.text_input("Nome do Produto:")
    descricao = st.text_area("Descrição:")
    data_inicio = st.date_input("Data de Início")
    hora_inicio = st.time_input("Hora de Início", value=datetime.today().time())
    data_fim = st.date_input("Data de Fim")
    hora_fim = st.time_input("Hora de Fim", value=datetime.today().time())
    estado = st.selectbox("Estado do produto:", ("Novo", "Semi-novo","Usado"))
    status = st.selectbox("Status do leilão:", ("Aberto", "Encerrado"))
    preco_inicial = st.number_input("Insira o preço inicial:")
    id_usuario_criador = st.number_input("Insira o ID do usuário criador:")

    if st.button("Criar Leilão"):
        if nome_produto and descricao and data_inicio and data_fim:
            try:
                dt_inicio = datetime.combine(data_inicio, hora_inicio)
                dt_fim = datetime.combine(data_fim, hora_fim)

                query = load_query("criar_leilao.sql")
                df = run_query(query, {"nome_produto": nome_produto, "descricao": descricao,
                                       "status": status, "estado": estado, "data_hora_inicio": dt_inicio,
                                       "data_hora_fim": dt_fim, "preco_inicial": preco_inicial, "id_usuario_criador": id_usuario_criador})
            except Exception as e:
                st.error(f"Erro ao criar leilão: {e}")
        else:
            st.warning("Preencha todos os campos antes de criar o leilão.")

# --- Opção 3: Deletar Usuário ---
elif opcao == "Deletar Usuário":
    email_usuario = st.text_input("Email do Usuário a ser deletado:")

    if st.button("Deletar Usuário"):
        if email_usuario:
            try:
                query = load_query("deletar_usuario.sql")
                df = run_query(query, {"email_usuario": email_usuario})
            except Exception as e:
                st.error(f"Erro ao deletar usuário: {e}")
        else:
            st.warning("Digite um email válido")
