#FROM python:alpine3.7
FROM public.ecr.aws/sam/build-python3.7:latest
COPY . /app
WORKDIR /app
RUN yum update -y; yum upgrade -y; pip install -r requirements.txt
EXPOSE 5002
ENTRYPOINT ["python","./app.py"]
