# Usar uma imagem base compatível com CUDA e PyTorch
FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

# Atualizar pacotes e instalar dependências do sistema
RUN apt update && apt install -y git wget curl

# Definir o diretório de trabalho
WORKDIR /app

# Clonar o repositório do DeepSeek-V3
RUN git clone https://github.com/deepseek-ai/DeepSeek-V3.git /app

# Instalar dependências do Python
RUN pip install --upgrade pip && pip install -r /app/inference/requirements.txt

# Comando para iniciar o modelo automaticamente no RunPod
CMD ["python", "-m", "deepseek.model"]
