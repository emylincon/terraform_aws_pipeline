FROM public.ecr.aws/sam/build-python3.7:latest
COPY . /app
WORKDIR /app
RUN yum update -y; yum upgrade -y; pip install -r requirements.txt

RUN pytest test_application.py
EXPOSE 5000

CMD ["python3", "app.py"]