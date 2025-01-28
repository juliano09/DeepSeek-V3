# Use uma imagem base compatível com CUDA e PyTorch
FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

# Instalar dependências do sistema
RUN apt update && apt install -y git wget curl

# Criar diretório para o app
WORKDIR /app

# Clonar o repositório do DeepSeek
RUN git clone https://github.com/deepseek-ai/DeepSeek-V3.git /app

# Instalar dependências do Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Adicionar um arquivo server.py para rodar o modelo como API
COPY server.py /app/server.py

# Expor a porta da API
EXPOSE 8000

# Comando para rodar o servidor Flask/FastAPI
CMD ["python", "server.py"]
