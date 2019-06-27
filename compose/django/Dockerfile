FROM python


#RUN groupadd -r haha \
#$$ useradd -r -g haha haha

RUN mkdir /requirements
RUN mkdir -p /Wendao/backend

COPY ./requirements /requirements

RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple 
RUN pip install --no-cache-dir -r /requirements/production.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \
&& rm -rf /requirements

#COPY ./compose/django/gunicorn.sh /
COPY ./compose/django/gunicorn.sh /
COPY ./compose/django/gunicorn.py /

RUN sed -i 's/\r//' /gunicorn.sh \
    && chmod +x /gunicorn.sh \
    && chown root /gunicorn.sh



COPY . /Wendao/backend

RUN cat /gunicorn.sh

RUN chown -R root /Wendao

USER root

#WORKDIR /Wendao/backend

#ENTRYPOINT ["/gunicorn.sh"]
#CMD ["sh","/gunicorn.sh"]


