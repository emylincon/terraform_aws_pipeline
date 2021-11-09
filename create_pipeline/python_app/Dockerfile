#FROM python:alpine3.7
FROM public.ecr.aws/alexaprizesharedresources/python:3.7-slim-buster
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5002
ENTRYPOINT ["python","./app.py"]