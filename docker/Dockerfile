# vim: ft=dockerfile
FROM python:3.11-alpine AS builder
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade poetry
COPY  ./workflow /workflow/workflow
COPY  ./poetry.lock /workflow/poetry.lock
COPY  ./pyproject.toml /workflow/pyproject.toml
COPY  ./README.md /workflow/README.md
RUN cd /workflow && poetry build --format=wheel

FROM python:3.11-alpine AS workflow
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
COPY --from=builder /workflow/dist /tmp/workflow
RUN pip install /tmp/workflow/*.whl && rm -rf /tmp/workflow
COPY docker/entrypoint.sh /usr/bin
CMD /usr/bin/entrypoint.sh
