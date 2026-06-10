# Imagen de Python
FROM python:3.10

# Crear y usar directorio de trabajo
WORKDIR /app

# Copiar archivos
COPY app/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código fuente restante
COPY app .

# Exponer puerto
EXPOSE 5000

# Comando para iniciar Flask
CMD ["python", "appflsk.py"]
