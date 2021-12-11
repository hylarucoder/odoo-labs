FROM ubuntu:focal
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    dirmngr \
    fonts-noto-cjk \
    gnupg \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjpeg8-dev \
    liblcms2-dev \
    libldap2-dev \
    libopenjp2-7-dev \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libtiff5-dev \
    libwebp-dev \
    libxcb1-dev \
    libxml2-dev \
    libxslt1-dev \
    node-less \
    npm \
    postgresql-client \
    python3-dev \
    python3-num2words \
    python3-pdfminer \
    python3-phonenumbers \
    python3-pip \
    python3-pyldap \
    python3-qrcode \
    python3-renderpm \
    python3-setuptools \
    python3-slugify \
    python3-vobject \
    python3-watchdog \
    python3-xlrd \
    python3-xlwt \
    xz-utils \
    zlib1g-dev \
    wget

# RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb && apt install -y ./wkhtmltox_0.12.6-1.focal_amd64.deb
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_arm64.deb && apt install -y ./wkhtmltox_0.12.6-1.focal_arm64.deb

RUN npm install -g rtlcss

WORKDIR /var/www/odoo

ENV PYPI=https://mirrors.aliyun.com/pypi/simple/
ENV PIP_DEFAULT_TIMEOUT=1000
RUN pip install -U pip -i $PYPI 
COPY ./odoo/requirements.txt ./odoo/requirements.txt
RUN pip install -r ./odoo/requirements.txt -i $PYPI
COPY . .
RUN pip install -e ./odoo
EXPOSE 8069 8071 8072
