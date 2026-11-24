FROM python:3.13-slim
WORKDIR /app
COPY loremipsum/ ./loremipsum/
CMD ["python", "-c", "import loremipsum; print(loremipsum.sentence(max_char=50))"]